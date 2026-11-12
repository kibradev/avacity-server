package §_-9VF§
{
   import §_-1t9§.§_-4Wb§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-3yI§ implements §_-0Yu§
   {
      public static const §_-1Ow§:int = -1;
      
      public static const §_-8UU§:int = 0;
      
      public static const §_-0Se§:int = 1;
      
      public static const §_-9z3§:int = 2;
      
      public static const §_-AnI§:int = 3;
      
      public static const §_-0GF§:int = 4;
      
      public static const §_-CDT§:int = 5;
      
      public static const §_-6H5§:String = "sid";
      
      public static const §_-5Wq§:String = "snid";
      
      public static const §_-50S§:String = "fn";
      
      public static const §_-20Y§:String = "ln";
      
      public static const §_-u9§:String = "nk";
      
      public static const §_-1sW§:String = "bd";
      
      public static const §_-1ne§:String = "pht";
      
      public static const §_-29f§:String = "lng";
      
      public static const §_-7Wi§:String = "lcl";
      
      public static const §_-AEP§:String = "cty";
      
      public static const §_-9cx§:String = "ctr";
      
      public static const §_-2K5§:String = "gdr";
      
      public static const §_-BmU§:String = "rl";
      
      public static const §_-1vo§:String = "al";
      
      public static const §_-CGx§:String = "il";
      
      public static const §_-h§:String = "rd";
      
      private var §_-7Zk§:String = "";
      
      private var §_-0cx§:int = 0;
      
      private var §_-BRm§:String = "";
      
      private var §_-8Vo§:String = "";
      
      private var §_-6rP§:String = "";
      
      private var §_-4kp§:String = "";
      
      private var §_-BSf§:int = 0;
      
      private var §_-Zq§:String = "";
      
      private var §_-1iW§:String = "";
      
      private var §_-C1D§:String = "";
      
      private var §_-04A§:int = 0;
      
      private var §_-KR§:int = 0;
      
      private var §_-8o4§:int = 0;
      
      private var §_-26G§:int = 0;
      
      private var §_-63E§:int = 0;
      
      private var §_-73u§:int = 0;
      
      public function §_-3yI§()
      {
         super();
      }
      
      public function get name() : String
      {
         return this.§_-BRm§ + " " + this.§_-8Vo§;
      }
      
      public function get socialId() : String
      {
         return this.§_-7Zk§;
      }
      
      public function §_-Ark§(param1:§_-4Wb§) : void
      {
         this.§_-7Zk§ = param1.id;
         this.§_-BRm§ = param1.firstName;
         this.§_-8Vo§ = param1.lastName;
         this.§_-6rP§ = param1.§_-CXL§;
         this.§_-4kp§ = param1.birthday;
         this.§_-BSf§ = param1.gender;
         this.§_-Zq§ = param1.photoUrl;
         this.§_-04A§ = param1.cityId;
         this.§_-KR§ = param1.§_-B1w§;
      }
      
      public function get §_-3CQ§() : int
      {
         return this.§_-8o4§;
      }
      
      public function set lang(param1:String) : void
      {
         this.§_-1iW§ = param1;
      }
      
      public function set locale(param1:String) : void
      {
         this.§_-C1D§ = param1;
      }
      
      public function get avatariaLevel() : int
      {
         return this.§_-26G§;
      }
      
      public function get islandLevel() : int
      {
         return this.§_-63E§;
      }
      
      public function get role() : int
      {
         return this.§_-8o4§;
      }
      
      public function get socialNetworkId() : int
      {
         return this.§_-0cx§;
      }
      
      public function get regDate() : int
      {
         return this.§_-73u§;
      }
      
      public function set gender(param1:int) : void
      {
         this.§_-BSf§ = param1;
      }
      
      public function get locale() : String
      {
         return this.§_-C1D§;
      }
      
      public function get firstName() : String
      {
         return this.§_-BRm§;
      }
      
      public function get userProfile() : §_-4Wb§
      {
         var _loc1_:§_-4Wb§ = new §_-4Wb§();
         _loc1_.id = this.socialId;
         _loc1_.firstName = this.§_-BRm§;
         _loc1_.lastName = this.§_-8Vo§;
         _loc1_.§_-CXL§ = this.§_-6rP§;
         _loc1_.birthday = this.§_-4kp§;
         _loc1_.gender = this.§_-BSf§;
         _loc1_.photoUrl = this.§_-Zq§;
         _loc1_.§_-5pW§ = this.§_-Zq§ != null && this.§_-Zq§ != "";
         return _loc1_;
      }
      
      public function clone() : §_-3yI§
      {
         var _loc1_:§_-3yI§ = new §_-3yI§();
         _loc1_.§_-7Zk§ = this.§_-7Zk§;
         _loc1_.§_-0cx§ = this.§_-0cx§;
         _loc1_.§_-BRm§ = this.§_-BRm§;
         _loc1_.§_-8Vo§ = this.§_-8Vo§;
         _loc1_.§_-6rP§ = this.§_-6rP§;
         _loc1_.§_-4kp§ = this.§_-4kp§;
         _loc1_.§_-BSf§ = this.§_-BSf§;
         _loc1_.§_-Zq§ = this.§_-Zq§;
         _loc1_.§_-1iW§ = this.§_-1iW§;
         _loc1_.§_-C1D§ = this.§_-C1D§;
         _loc1_.§_-04A§ = this.§_-04A§;
         _loc1_.§_-KR§ = this.§_-KR§;
         _loc1_.§_-8o4§ = this.§_-8o4§;
         _loc1_.§_-26G§ = this.§_-26G§;
         _loc1_.§_-63E§ = this.§_-63E§;
         _loc1_.§_-73u§ = this.§_-73u§;
         return _loc1_;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-7Zk§ = param1.getString(§_-6H5§);
         this.§_-0cx§ = param1.getInt(§_-5Wq§);
         this.§_-BRm§ = param1.getString(§_-50S§);
         this.§_-8Vo§ = param1.getString(§_-20Y§);
         this.§_-6rP§ = param1.getString(§_-u9§);
         this.§_-4kp§ = param1.getString(§_-1sW§);
         this.§_-BSf§ = param1.getInt(§_-2K5§);
         this.§_-Zq§ = param1.getString(§_-1ne§);
         this.§_-1iW§ = param1.getString(§_-29f§);
         this.§_-C1D§ = param1.getString(§_-7Wi§);
         this.§_-04A§ = param1.getInt(§_-AEP§);
         this.§_-KR§ = param1.getInt(§_-9cx§);
         this.§_-8o4§ = param1.getInt(§_-BmU§);
         this.§_-26G§ = param1.getInt(§_-1vo§);
         this.§_-63E§ = param1.getInt(§_-CGx§);
         this.§_-73u§ = param1.getInt(§_-h§);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-6H5§,this.socialId);
         param1.put(§_-5Wq§,this.§_-0cx§);
         param1.put(§_-50S§,this.§_-BRm§);
         param1.put(§_-20Y§,this.§_-8Vo§);
         param1.put(§_-u9§,this.§_-6rP§);
         param1.put(§_-1sW§,this.§_-4kp§);
         param1.put(§_-2K5§,this.§_-BSf§);
         param1.put(§_-1ne§,this.§_-Zq§);
         param1.put(§_-29f§,this.§_-1iW§);
         param1.put(§_-7Wi§,this.§_-C1D§);
         param1.put(§_-AEP§,this.§_-04A§);
         param1.put(§_-9cx§,this.§_-KR§);
         param1.put(§_-h§,this.§_-73u§);
      }
   }
}

