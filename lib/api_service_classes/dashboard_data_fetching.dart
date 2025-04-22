
class JobMetrics {
  final int enquiryCount;
  final int quotationCount;
  final int totalJobs;
  final int completedJobs;
  final int pendingJobs;
  final int inProgressJobs;
  final int onHoldJobs;
  final int testingJobs;
  final int washingJobs;


  // Constructor
  JobMetrics({
    required this.enquiryCount,
    required this.quotationCount,
    required this.totalJobs,
    required this.completedJobs,
    required this.pendingJobs,
    required this.inProgressJobs,
    required this.onHoldJobs,
    required this.testingJobs,
    required this.washingJobs,
  });

  // Factory method to create a JobMetrics instance from JSON
  factory JobMetrics.fromJson(Map<String, dynamic> json) {
    return JobMetrics(
      enquiryCount: json['enquiriesCount']??0,
      quotationCount: json['quotationsCount']?? 0,
      totalJobs: json['total_jobs'] ?? 0,
      completedJobs: json['completed_jobs'] ?? 0,
      pendingJobs: json['pending_jobs'] ?? 0,
      inProgressJobs: json['in_progress_jobs'] ?? 0,
      onHoldJobs: json['on_hold_jobs'] ?? 0,
      testingJobs: json['testing_jobs'] ?? 0,
      washingJobs: json['washing_jobs'] ?? 0,

    );
  }
}
