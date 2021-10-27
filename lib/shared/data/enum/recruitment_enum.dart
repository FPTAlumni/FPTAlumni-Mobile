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
  @JsonValue("title")
  title,
  @JsonValue("Status")
  status,
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
