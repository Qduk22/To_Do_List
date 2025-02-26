class Meta {
  int totalItems;
  int totalPages;
  int perPageItem;
  int currentPage;
  int pageSize;
  bool hasMorePage;

  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
    perPageItem: json["per_page_item"],
    currentPage: json["current_page"],
    pageSize: json["page_size"],
    hasMorePage: json["has_more_page"],
  );

  Map<String, dynamic> toJson() => {
    "total_items": totalItems,
    "total_pages": totalPages,
    "per_page_item": perPageItem,
    "current_page": currentPage,
    "page_size": pageSize,
    "has_more_page": hasMorePage,
  };
}
