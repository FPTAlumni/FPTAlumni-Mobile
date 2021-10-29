import 'package:json_annotation/json_annotation.dart';

enum Experience {
  intern,
  fresher,
  junior,
  senior,
  professional,
}

enum RecruitmentType {
  @JsonValue("Fulltime")
  fullTime,
  @JsonValue("Parttime")
  partTime,
}

enum RecruitmentSortKey {
  @JsonValue("CreatedDate")
  createdDate,
  @JsonValue("Title")
  title,
  @JsonValue("Status")
  status,
}

enum RecruitmentStatus {
  @JsonValue("Rejected")
  rejected,
  @JsonValue("Active")
  active,
  @JsonValue("Pending")
  pending,
  @JsonValue(null)
  none,
}

class MyRecruitmentStatus {
  static const String approved = 'Approved';
  static const String pending = 'Pending';
  static const String rejected = 'Rejected';
  static const String ended = 'Ended';
}

class RecruitmentEnum {
  static Map<Experience, String> experienceMap = {
    Experience.intern: 'Intern',
    Experience.fresher: 'Fresher',
    Experience.junior: 'Junior',
    Experience.senior: 'Senior',
    Experience.professional: 'Professional',
  };

  static Map<RecruitmentType, String> typeMap = {
    RecruitmentType.fullTime: 'Full-time',
    RecruitmentType.partTime: 'Part-time',
  };

  static int getTypeIndex(RecruitmentType type) {
    switch (type) {
      case RecruitmentType.fullTime:
        return 0;
      case RecruitmentType.partTime:
        return 1;
    }
  }
}
