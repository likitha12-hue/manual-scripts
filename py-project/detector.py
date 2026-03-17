import os
import json
import datetime
import subprocess

CONFIG_FILE = "config.json"
REPORT_FILE = "drift_report.txt"


# -------------------------------
# Utility Functions
# -------------------------------

def load_config():
    try:
        with open(CONFIG_FILE, "r") as f:
            return json.load(f)
    except Exception as e:
        print(f"Error loading config: {e}")
        return {}


def run_command(command):
    try:
        result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return result.returncode == 0, result.stdout.decode().strip()
    except Exception as e:
        return False, str(e)


# -------------------------------
# Checks
# -------------------------------

def check_service(service):
    status, _ = run_command(f"systemctl is-active --quiet {service}")
    return status


def check_port(port):
    status, output = run_command(f"ss -tuln | grep :{port}")
    return status


def check_file(filepath):
    return os.path.exists(filepath)


# -------------------------------
# Drift Detection
# -------------------------------

def detect_drift(config):
    missing_services = []
    closed_ports = []
    missing_files = []

    # Check services
    for service in config.get("services", []):
        if not check_service(service):
            missing_services.append(service)

    # Check ports
    for port in config.get("ports", []):
        if not check_port(port):
            closed_ports.append(port)

    # Check files
    for file in config.get("files", []):
        if not check_file(file):
            missing_files.append(file)

    return missing_services, closed_ports, missing_files


# -------------------------------
# Auto Fix (Optional)
# -------------------------------

def auto_fix(services):
    fixed = []
    for service in services:
        status, _ = run_command(f"sudo systemctl start {service}")
        if status:
            fixed.append(service)
    return fixed


# -------------------------------
# Report Generation
# -------------------------------

def generate_report(missing_services, closed_ports, missing_files, fixed_services):
    now = datetime.datetime.now()

    report = []
    report.append("CONFIG DRIFT REPORT")
    report.append(f"Generated at: {now}")
    report.append("=" * 40)

    report.append("\nMissing Services:")
    report.extend([f"- {s}" for s in missing_services] or ["None"])

    report.append("\nClosed Ports:")
    report.extend([f"- {p}" for p in closed_ports] or ["None"])

    report.append("\nMissing Files:")
    report.extend([f"- {f}" for f in missing_files] or ["None"])

    report.append("\nAuto-Fixed Services:")
    report.extend([f"- {s}" for s in fixed_services] or ["None"])

    with open(REPORT_FILE, "w") as f:
        f.write("\n".join(report))


# -------------------------------
# Git Automation
# -------------------------------

def push_to_git():
    os.system("git add .")
    os.system('git commit -m "Update drift report"')
    os.system("git push origin main")


# -------------------------------
# Main Execution
# -------------------------------

def main():
    print("Starting Config Drift Detection...")

    config = load_config()
    if not config:
        print("No config found. Exiting.")
        return

    missing_services, closed_ports, missing_files = detect_drift(config)

    # Auto-fix services
    fixed_services = auto_fix(missing_services)

    # Generate report
    generate_report(missing_services, closed_ports, missing_files, fixed_services)

    print("Drift detection completed. Report generated.")

    # Push to GitHub
    push_to_git()
    print("Changes pushed to GitHub.")


if __name__ == "__main__":
    main()
