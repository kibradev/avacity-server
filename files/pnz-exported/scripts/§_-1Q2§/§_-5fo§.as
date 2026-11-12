package §_-1Q2§
{
   import §_-9Bv§.§_-8fL§;
   import §_-Aq0§.§_-Bs9§;
   
   public class §_-5fo§
   {
      private static const URL:String = "http://api.nanigans.com/event.php";
      
      private static var _instance:§_-5fo§ = null;
      
      private var _appId:String = null;
      
      private var _userId:String = null;
      
      private var §_-9MH§:Boolean = false;
      
      public function §_-5fo§()
      {
         super();
      }
      
      public static function get instance() : §_-5fo§
      {
         if(_instance == null)
         {
            _instance = new §_-5fo§();
         }
         return _instance;
      }
      
      public function configure(param1:§_-8fL§, param2:String) : void
      {
         if(param1 != null)
         {
            this._appId = param1.getString("appId");
            this.§_-9MH§ = param1.getBoolean("logging",false);
         }
         this._userId = param2;
      }
      
      public function §_-0vn§() : void
      {
         var _loc1_:Object = {};
         _loc1_["s2s"] = "1";
         _loc1_["type"] = "visit";
         _loc1_["name"] = "dau";
         this.§_-9mc§(_loc1_);
      }
      
      public function finishTutorial() : void
      {
         var _loc1_:Object = {};
         _loc1_["s2s"] = "1";
         _loc1_["type"] = "user";
         _loc1_["name"] = "tutorial";
         this.§_-9mc§(_loc1_);
      }
      
      public function purchase(param1:Number) : void
      {
         var _loc2_:Object = {};
         _loc2_["s2s"] = "1";
         _loc2_["type"] = "purchase";
         _loc2_["name"] = "main";
         _loc2_["value"] = param1;
         this.§_-9mc§(_loc2_);
      }
      
      public function wallPost() : void
      {
         var _loc1_:Object = {};
         _loc1_["s2s"] = "1";
         _loc1_["type"] = "viral";
         _loc1_["name"] = "wallpost";
         this.§_-9mc§(_loc1_);
      }
      
      public function inviteFriends() : void
      {
         var _loc1_:Object = {};
         _loc1_["s2s"] = "1";
         _loc1_["type"] = "viral";
         _loc1_["name"] = "invite";
         this.§_-9mc§(_loc1_);
      }
      
      private function §_-9mc§(param1:Object) : void
      {
         if(!this.§_-9MH§)
         {
            return;
         }
         param1["app_id"] = this._appId;
         param1["user_id"] = this._userId;
         var _loc2_:§_-Bs9§ = new §_-Bs9§();
         _loc2_.url = URL;
         _loc2_.§_-0fS§(param1);
         _loc2_.send();
      }
   }
}

