const baseUrl = "http://localhost:2020"; // Or your deployed URL

class APIPath {
  // -------- Auth ----------
  static String login = "$baseUrl/auth/login";
  static String register = "$baseUrl/auth/register";
  static String refreshToken = "$baseUrl/auth/refreshToken";

  // -------- Master Data: Banner --------
  static String getAllBanner = "$baseUrl/masterdata/banner/getAll";

  // -------- Master Data: Category --------
  static String getAllCategory = "$baseUrl/masterdata/category/getAll";

  // -------- Master Data: Product --------
  static String getProductAll = "$baseUrl/masterdata/product/getAll";
  static String getProductByCategory = "$baseUrl/masterdata/product/getByCategory/"; 
  // Add category ID at the end when calling
}
