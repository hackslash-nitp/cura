class IndividualUser {
  final String individualName,
      individualEmail,
      individualContact,
      occupation,
      country,
      city,
      gender,
      imgUrl,
      dob,
      education,
      bio;

  IndividualUser(
      {required this.individualName,
      required this.individualEmail,
      required this.individualContact,
      required this.occupation,
      required this.country,
      required this.city,
      required this.gender,
      required this.imgUrl,
      required this.dob,
      required this.education,
      required this.bio});

  Map<String, String> toJSON() {
    Map<String, String> individual = {
      'individualName': individualName,
      'individualEmail': individualEmail,
      'individualContact': individualContact,
      'occupation': occupation,
      'country': country,
      'city': city,
      'gender': gender,
      'imgUrl': imgUrl,
      'dob': dob,
      'education': education,
      'bio': bio
    };
    return individual;
  }

  IndividualUser getIndUser(Map<String, String> ind) {
    return IndividualUser(
        individualName: ind['individualName']!,
        individualEmail: ind['individualEmail']!,
        individualContact: ind['individualContact']!,
        occupation: ind['occupation']!,
        country: ind['country']!,
        city: ind['city']!,
        gender: ind['gender']!,
        imgUrl: ind['imgUrl']!,
        dob: ind['dob']!,
        education: ind['education']!,
        bio: ind['bio']!);
  }
}
