
# health_info_platform

## Overview

This Health Information Sharing Platform is a decentralized application (dApp) built on the Internet Computer Protocol (ICP). It enables users to securely add and query their health information. Each entry is timestamped, allowing users to track their health information over time.

## Features

- **Add Health Information**: Users can add their health information along with an automatic timestamp.
- **Query Health Information**: Users can retrieve all health information associated with their user ID.
- **Get Latest Health Information**: Users can get their most recent health information entry along with the timestamp.

## Getting Started

### Prerequisites

- DFX (the Internet Computer software development kit)
- A running local Internet Computer network or access to the Internet Computer blockchain.

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd HealthInfoSharingPlatform
   ```
3. Install the necessary dependencies:
   ```bash
   dfx deploy
   ```

### Usage

To add health information:
```bash
dfx canister call healthInfoSharing addHealthInfo '("user-id", "health information")'
```

To query all health information for a user:
```bash
dfx canister call healthInfoSharing getHealthInfo '("user-id")'
```

To get the latest health information for a user:
```bash
dfx canister call healthInfoSharing getLatestHealthInfo '("user-id")'
```

## Contributing

Contributions to the Health Information Sharing Platform are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
