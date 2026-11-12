package §_-5Zh§
{
   import §_-18o§.§_-A8q§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-x4§ implements §_-8d2§
   {
      public static const §_-5im§:String = "cid";
      
      public static const TITLE:String = "ctl";
      
      public static const §_-12R§:String = "crl";
      
      public static const §_-AN3§:String = "clv";
      
      public static const §_-3Bl§:String = "acv";
      
      public static const §_-C-h§:String = "icn";
      
      public static const §_-30D§:String = "crst";
      
      public static const §_-0vR§:String = "tg";
      
      private var _clanId:int;
      
      private var §_-Avc§:String;
      
      private var §_-8o4§:int;
      
      private var _level:int;
      
      private var §_-7HR§:int;
      
      private var _icon:String;
      
      private var §_-61m§:int;
      
      private var §_-8Fk§:String = "";
      
      public function §_-x4§()
      {
         super();
      }
      
      public function get clanId() : int
      {
         return this._clanId;
      }
      
      public function set clanId(param1:int) : void
      {
         this._clanId = param1;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function set title(param1:String) : void
      {
         this.§_-Avc§ = param1;
      }
      
      public function get role() : int
      {
         return this.§_-8o4§;
      }
      
      public function set role(param1:int) : void
      {
         this.§_-8o4§ = param1;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
      
      public function get activityRating() : int
      {
         return this.§_-7HR§;
      }
      
      public function set activityRating(param1:int) : void
      {
         this.§_-7HR§ = param1;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function set icon(param1:String) : void
      {
         this._icon = param1;
      }
      
      public function get §_-8hq§() : int
      {
         return this.§_-61m§;
      }
      
      public function set §_-8hq§(param1:int) : void
      {
         this.§_-61m§ = param1;
      }
      
      public function get tag() : String
      {
         return this.§_-8Fk§;
      }
      
      public function set tag(param1:String) : void
      {
         this.§_-8Fk§ = param1;
      }
      
      public function get taggedTitle() : String
      {
         return "[" + this.tag + "]" + this.title;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-CZf§(§_-5im§,this._clanId);
         param1.putString(TITLE,this.§_-Avc§);
         param1.§_-CZf§(§_-12R§,this.§_-8o4§);
         param1.§_-CZf§(§_-AN3§,this._level);
         param1.§_-CZf§(§_-3Bl§,this.§_-7HR§);
         param1.putString(§_-C-h§,this._icon);
         param1.§_-CZf§(§_-30D§,this.§_-61m§);
         param1.putString(§_-0vR§,this.§_-8Fk§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._clanId = param1.getInt(§_-5im§);
         this.§_-Avc§ = param1.getString(TITLE);
         this.§_-8o4§ = param1.getInt(§_-12R§);
         this._level = param1.getInt(§_-AN3§);
         this.§_-7HR§ = param1.getInt(§_-3Bl§);
         this._icon = param1.getString(§_-C-h§);
         this.§_-61m§ = param1.getInt(§_-30D§);
         this.§_-8Fk§ = param1.getString(§_-0vR§);
      }
      
      public function clone() : §_-x4§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

