class OrganisationUser {
  final String orgName,
      orgEmail,
      orgContact,
      orgRegNumber,
      country,
      address,
      pincode,
      imgUrl,
      estDate,
      attachmentUrl;

  OrganisationUser(
      {required this.orgName,
      required this.orgEmail,
      required this.orgContact,
      required this.orgRegNumber,
      required this.country,
      required this.address,
      required this.pincode,
      required this.imgUrl,
      required this.estDate,
      required this.attachmentUrl});

  Map<String, String> toJSON() {
    Map<String, String> organisation = {
      'orgName': orgName,
      'orgEmail': orgEmail,
      'orgContact': orgContact,
      'orgRegNumber': orgRegNumber,
      'country': country,
      'address': address,
      'pincode': pincode,
      'imgUrl': imgUrl,
      'estDate': estDate,
      'attachmentUrl': attachmentUrl
    };
    return organisation;
  }

  OrganisationUser getOrgUser(Map<String, String> org) {
    return OrganisationUser(
        orgName: org['orgName']!,
        orgEmail: org['orgEmail']!,
        orgContact: org['orgContact']!,
        orgRegNumber: org['orgRegNumber']!,
        country: org['country']!,
        address: org['address']!,
        pincode: org['pincode']!,
        imgUrl: org['imgUrl']!,
        estDate: org['estDate']!,
        attachmentUrl: org['attachmentUrl']!);
  }
}
