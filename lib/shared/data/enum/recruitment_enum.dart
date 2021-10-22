import 'package:json_annotation/json_annotation.dart';

enum Experience {
  intern,
  fresher,
  junior,
  senior,
  professional,
}

enum RecruitmentStatus {
  @JsonValue("Active")
  active,
  @JsonValue("Inactive")
  inActive,
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
  @JsonValue("GroupName")
  groupName,
  @JsonValue("Status")
  status,
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
