class Property {
  final int id;
  final String property_title;
  final String image_URL;
  final String estate;
  final int bedrooms;
  final int gross_area;
  final int expected_tenants;
  final int rent;
  final String h_Property;

  const Property(
      {required this.id,
      required this.property_title,
      required this.image_URL,
      required this.estate,
      required this.bedrooms,
      required this.gross_area,
      required this.expected_tenants,
      required this.rent,
      required this.h_Property});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      property_title: json['property_title'],
      image_URL: json['image_URL'],
      estate: json['estate'],
      bedrooms: json['bedrooms'],
      gross_area: json['gross_area'],
      expected_tenants: json['expected_tenants'],
      rent: json['rent'],
      h_Property: json['h_Property'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'property_title': property_title,
      'image_URL': image_URL,
      'estate': estate,
      'bedrooms': bedrooms,
      'gross_area': gross_area,
      'expected_tenants': expected_tenants,
      'rent': rent,
      'h_Property': h_Property,
    };
  }


}
