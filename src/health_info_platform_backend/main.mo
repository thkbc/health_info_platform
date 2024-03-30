import Array "mo:base/Array";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Time "mo:base/Time";

actor HealthInfoSharing {
    // Define types for user ID, health info, timestamp, and health record.
    type UserId = Text;
    type HealthInfo = Text;
    type Timestamp = Nat64;
    type HealthRecord = (UserId, HealthInfo, Timestamp);

    // Array to store health records.
    private var healthRecords : [HealthRecord] = [];

    // Function to add new health information with current timestamp.
    public func addHealthInfo(userId : UserId, healthInfo : HealthInfo) : async () {
        let timestamp = Time.now(); // Get current timestamp.
        healthRecords := healthRecords + [(userId, healthInfo, timestamp)]; // Add record.
    };

    // Query function to get all health information for a user.
    public query func getHealthInfo(userId : UserId) : async [HealthInfo] {
        let userRecords = Array.filter(healthRecords, func((id, _, _)) : Bool { id == userId }); // Filter records by user ID.
        return Array.map(userRecords, func(_, info, _) : HealthInfo { info }); // Return health info.
    };

    // Query function to get the latest health information and timestamp for a user.
    public query func getLatestHealthInfo(userId : UserId) : async ?(HealthInfo, Timestamp) {
        let userRecords = Array.filter(healthRecords, func((id, _, _)) : Bool { id == userId }); // Filter records by user ID.
        if (Array.size(userRecords) == 0) {
            return null; // Return null if no records found.
        };
        // Find the latest record.
        let latestRecord = Array.fold<HealthRecord, ?HealthRecord>(
            userRecords,
            null,
            func(acc : ?HealthRecord, curr : HealthRecord) : ?HealthRecord {
                switch acc {
                    case (null) : ?curr;
                    case (?accVal) : {
                        if (curr.2 > accVal.2) { ?curr } else { acc }; // Compare timestamps.
                    };
                };
            },
        );
        // Return the latest health info and timestamp.
        switch latestRecord {
            case (null) : { return null };
            case (?latest) : { return ?(latest.1, latest.2) };
        };
    };
};
