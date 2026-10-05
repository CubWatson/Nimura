#!/usr/bin/env bash
# Sets up Nimura's issue labels. Run once with the GitHub CLI logged in: bash setup-labels.sh
set -e
R=CubWatson/Nimura

# Remove default labels that don't fit an issue-only modpack tracker
for l in "good first issue" "help wanted" "documentation" "accessibility" "enhancement"; do
  gh label delete "$l" -R $R --yes 2>/dev/null || true
done

# Type
gh label create "bug"            -R $R --force -c d73a4a -d "Something isn't working"
gh label create "crash"          -R $R --force -c b60205 -d "Game crashes or won't launch"
gh label create "mod suggestion" -R $R --force -c a2eeef -d "Suggest adding or removing a mod"
gh label create "question"       -R $R --force -c d876e3 -d "Further information is requested"

# Status
gh label create "needs triage"   -R $R --force -c fbca04 -d "Not looked at yet"
gh label create "needs info"     -R $R --force -c f9d0c4 -d "Waiting on logs or details from the reporter"
gh label create "confirmed"      -R $R --force -c 0e8a16 -d "Reproduced, will be fixed"
gh label create "upstream"       -R $R --force -c 5319e7 -d "Bug is in a mod itself, reported to its author"
gh label create "duplicate"      -R $R --force -c cfd3d7 -d "Already reported"
gh label create "invalid"        -R $R --force -c e4e669 -d "Not a Nimura issue"
gh label create "wontfix"        -R $R --force -c ffffff -d "This will not be worked on"
