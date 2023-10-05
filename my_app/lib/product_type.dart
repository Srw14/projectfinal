class ProductType{
  final int productTypeId;
  final String productTypeName;

  const ProductType(
    {required this.productTypeId, required this.productTypeName});

  factory ProductType.fromJSON(Map<String, dynamic> json) {
    return ProductType(
      productTypeId: json["product_type_id"],
      productTypeName: json["producy_type_name"]);
  }
}