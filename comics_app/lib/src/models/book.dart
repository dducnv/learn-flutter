class BookModal {
  int? numberOfChapter;
  String? authorName;
  String? bookName;
  int? rating;
  int? authorAccountId;
  int? bookSexId;
  String? bookThumb;
  String? imgUrl;
  String? bookUUID;
  int? likeNo;
  String? categoryList;
  int? bookId;
  int? updateStatus;
  int? viewNo;
  String? lastUpdateTime;

  BookModal(
      {this.numberOfChapter,
      this.authorName,
      this.bookName,
      this.rating,
      this.authorAccountId,
      this.bookSexId,
      this.bookThumb,
      this.imgUrl,
      this.bookUUID,
      this.likeNo,
      this.categoryList,
      this.bookId,
      this.updateStatus,
      this.viewNo,
      this.lastUpdateTime});

  BookModal.fromJson(Map<String, dynamic> json) {
    numberOfChapter = json['NumberOfChapter'];
    authorName = json['AuthorName'];
    bookName = json['BookName'];
    rating = json['Rating'];
    authorAccountId = json['authorAccountId'];
    bookSexId = json['BookSexId'];
    bookThumb = json['BookThumb'];
    imgUrl = json['imgUrl'];
    bookUUID = json['BookUUID'];
    likeNo = json['LikeNo'];
    categoryList = json['CategoryList'];
    bookId = json['BookId'];
    updateStatus = json['updateStatus'];
    viewNo = json['ViewNo'];
    lastUpdateTime = json['lastUpdateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NumberOfChapter'] = this.numberOfChapter;
    data['AuthorName'] = this.authorName;
    data['BookName'] = this.bookName;
    data['Rating'] = this.rating;
    data['authorAccountId'] = this.authorAccountId;
    data['BookSexId'] = this.bookSexId;
    data['BookThumb'] = this.bookThumb;
    data['imgUrl'] = this.imgUrl;
    data['BookUUID'] = this.bookUUID;
    data['LikeNo'] = this.likeNo;
    data['CategoryList'] = this.categoryList;
    data['BookId'] = this.bookId;
    data['updateStatus'] = this.updateStatus;
    data['ViewNo'] = this.viewNo;
    data['lastUpdateTime'] = this.lastUpdateTime;
    return data;
  }
}