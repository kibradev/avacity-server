package §_-5z2§
{
   import §_-18o§.§_-8-S§;
   import §_-18o§.§_-A1F§;
   import §_-B1M§.§_-4vf§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import flash.net.SharedObject;
   
   public class §_-Aba§ extends §_-53f§
   {
      public static const §_-A2y§:String = "penzvilleCitySettings";
      
      public static const §_-5H5§:String = "musicEnabled";
      
      public static const §_-A2l§:String = "soundEnabled";
      
      public static const §_-A8r§:String = "showFortuneDialog";
      
      public static const §_-3bW§:String = "musicVolumeChange";
      
      public static const §_-0wk§:String = "soundVolumeChange";
      
      public static const §_-3og§:String = "highGraphics";
      
      public static const §_-4j7§:String = "cacheEnabled";
      
      public static const §_-6pj§:String = "hideUserInfo";
      
      public static const §_-6Ld§:String = "settingsMenuOpened";
      
      public static const §_-9rM§:String = "showAsteroidDialog";
      
      private var §_-8Vg§:Boolean = true;
      
      private var §_-97e§:Boolean = true;
      
      private var §_-3So§:Boolean = true;
      
      private var §_-6nK§:Boolean = true;
      
      private var §_-6bF§:Boolean = true;
      
      private var §_-9Ou§:Boolean = true;
      
      private var §_-48r§:Boolean = true;
      
      private var §_-0FT§:Boolean = true;
      
      private var §_-6O3§:Number = 1;
      
      private var §_-CRZ§:Number = 1;
      
      private var §_-0o4§:int = 0;
      
      private var §_-47D§:int = 0;
      
      private var §_-A-u§:SharedObject = null;
      
      private var §_-52b§:Object = {};
      
      public function §_-Aba§()
      {
         super();
         this.§_-CCH§();
         this.load();
      }
      
      public static function §_-4hA§(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return true;
         }
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         §_-8-S§.§_-1YU§(_loc2_);
         var _loc3_:Date = new Date();
         §_-8-S§.§_-1YU§(_loc3_);
         return _loc2_ < _loc3_;
      }
      
      public function §_-CCH§() : void
      {
         this.soundEnabled = true;
         this.musicEnabled = true;
         this.hideUserInfo = true;
         this.showFortuneDialog = true;
         this.highGraphics = true;
         this.settingsMenuOpened = true;
         this.soundVolume = 1;
         this.musicVolume = 1;
      }
      
      protected function §_-4-H§(param1:String) : void
      {
         this.§_-A-u§ = SharedObject.getLocal(param1,"/");
         this.§_-AgU§(this.§_-A-u§.data);
         this.§_-A-u§.close();
      }
      
      protected function §_-463§(param1:String) : void
      {
         this.§_-A-u§ = SharedObject.getLocal(param1,"/");
         this.§_-A-u§.clear();
         this.toObject(this.§_-A-u§.data);
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            this.§_-A-u§.flush();
         }
      }
      
      private function get §_-4Z9§() : String
      {
         return Context.§_-2BT§.adapter.socialNetwork + "_" + §_-A2y§;
      }
      
      public function load() : void
      {
         this.§_-4-H§(this.§_-4Z9§);
      }
      
      public function save() : void
      {
         this.§_-463§(this.§_-4Z9§);
      }
      
      public function §_-AgU§(param1:Object) : void
      {
         if(param1.hasOwnProperty("musicEnabled"))
         {
            this.musicEnabled = param1["musicEnabled"];
         }
         if(param1.hasOwnProperty("soundEnabled"))
         {
            this.soundEnabled = param1["soundEnabled"];
         }
         if(param1.hasOwnProperty("musicVolume"))
         {
            this.musicVolume = param1["musicVolume"];
         }
         if(param1.hasOwnProperty("soundVolume"))
         {
            this.soundVolume = param1["soundVolume"];
         }
         if(param1.hasOwnProperty("highGraphics"))
         {
            this.highGraphics = param1["highGraphics"];
         }
         if(param1.hasOwnProperty("hideUserInfo"))
         {
            this.hideUserInfo = param1["hideUserInfo"];
         }
         if(param1.hasOwnProperty("settingsMenuOpened"))
         {
            this.settingsMenuOpened = param1["settingsMenuOpened"];
         }
         if(param1.hasOwnProperty("showFortuneDialog"))
         {
            this.showFortuneDialog = param1["showFortuneDialog"];
         }
         if(param1.hasOwnProperty("yandexDialogOpenDate"))
         {
            this.yandexDialogOpenDate = param1["yandexDialogOpenDate"];
         }
         if(param1.hasOwnProperty("yandexDialogSelectCheckBoxDate"))
         {
            this.yandexDialogSelectCheckBoxDate = param1["yandexDialogSelectCheckBoxDate"];
         }
         if(param1.hasOwnProperty("showAsteroidDialog"))
         {
            this.showAsteroidDialog = param1["showAsteroidDialog"];
         }
         if(param1.hasOwnProperty("showModuleDialogs"))
         {
            this.showModuleDialogs = param1["showModuleDialogs"];
         }
      }
      
      public function toObject(param1:Object = null) : Object
      {
         if(param1 == null)
         {
            param1 = {};
         }
         param1["musicEnabled"] = this.musicEnabled;
         param1["soundEnabled"] = this.soundEnabled;
         param1["musicVolume"] = this.musicVolume;
         param1["soundVolume"] = this.soundVolume;
         param1["highGraphics"] = this.highGraphics;
         param1["hideUserInfo"] = this.hideUserInfo;
         param1["settingsMenuOpened"] = this.settingsMenuOpened;
         param1["showFortuneDialog"] = this.showFortuneDialog;
         param1["yandexDialogSelectCheckBoxDate"] = this.yandexDialogSelectCheckBoxDate;
         param1["yandexDialogOpenDate"] = this.yandexDialogOpenDate;
         param1["showAsteroidDialog"] = this.showAsteroidDialog;
         param1["showModuleDialogs"] = this.showModuleDialogs;
         return param1;
      }
      
      public function get musicEnabled() : Boolean
      {
         return this.§_-8Vg§;
      }
      
      public function set musicEnabled(param1:Boolean) : void
      {
         if(param1 != this.§_-8Vg§)
         {
            this.§_-8Vg§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-5H5§));
            this.save();
         }
      }
      
      public function get soundEnabled() : Boolean
      {
         return this.§_-97e§;
      }
      
      public function set soundEnabled(param1:Boolean) : void
      {
         if(param1 != this.§_-97e§)
         {
            this.§_-97e§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-A2l§));
            this.save();
         }
      }
      
      public function get highGraphics() : Boolean
      {
         return this.§_-3So§;
      }
      
      public function set highGraphics(param1:Boolean) : void
      {
         if(this.§_-3So§ != param1)
         {
            this.§_-3So§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-3og§));
            this.save();
         }
      }
      
      public function get cacheEnabled() : Boolean
      {
         return this.§_-6nK§;
      }
      
      public function set cacheEnabled(param1:Boolean) : void
      {
         if(this.§_-6nK§ != param1)
         {
            this.§_-6nK§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-4j7§));
         }
         this.§_-6nK§ = param1;
      }
      
      public function get hideUserInfo() : Boolean
      {
         return this.§_-6bF§;
      }
      
      public function set hideUserInfo(param1:Boolean) : void
      {
         if(this.§_-6bF§ != param1)
         {
            this.§_-6bF§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-6pj§));
            this.save();
         }
      }
      
      public function get settingsMenuOpened() : Boolean
      {
         return this.§_-9Ou§;
      }
      
      public function set settingsMenuOpened(param1:Boolean) : void
      {
         if(this.§_-9Ou§ != param1)
         {
            this.§_-9Ou§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-6Ld§));
            this.save();
         }
      }
      
      public function get showFortuneDialog() : Boolean
      {
         return this.§_-48r§;
      }
      
      public function set showFortuneDialog(param1:Boolean) : void
      {
         if(this.§_-48r§ != param1)
         {
            this.§_-48r§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-A8r§));
            this.save();
         }
      }
      
      public function get musicVolume() : Number
      {
         return this.§_-6O3§;
      }
      
      public function set musicVolume(param1:Number) : void
      {
         if(param1 != this.§_-6O3§)
         {
            this.§_-6O3§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-3bW§));
            this.save();
         }
      }
      
      public function get soundVolume() : Number
      {
         return this.§_-CRZ§;
      }
      
      public function set soundVolume(param1:Number) : void
      {
         if(param1 != this.§_-CRZ§)
         {
            this.§_-CRZ§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-0wk§));
            this.save();
         }
      }
      
      public function get yandexDialogSelectCheckBoxDate() : int
      {
         return this.§_-0o4§;
      }
      
      public function set yandexDialogSelectCheckBoxDate(param1:int) : void
      {
         if(param1 != this.§_-0o4§)
         {
            this.§_-0o4§ = param1;
            this.save();
         }
      }
      
      public function get yandexDialogOpenDate() : int
      {
         return this.§_-47D§;
      }
      
      public function set yandexDialogOpenDate(param1:int) : void
      {
         if(param1 != this.§_-47D§)
         {
            this.§_-47D§ = param1;
            this.save();
         }
      }
      
      public function get showAsteroidDialog() : Boolean
      {
         return this.§_-0FT§;
      }
      
      public function set showAsteroidDialog(param1:Boolean) : void
      {
         if(this.§_-0FT§ != param1)
         {
            this.§_-0FT§ = param1;
            dispatchEvent(new §_-4vf§(§_-4vf§.CHANGE,§_-Aba§.§_-9rM§));
            this.save();
         }
      }
      
      public function §_-4Be§(param1:String) : Boolean
      {
         return §_-A1F§.§_-6yZ§(this.§_-52b§,param1,true);
      }
      
      public function §_-3rM§(param1:String, param2:Boolean) : void
      {
         this.§_-52b§[param1] = param2;
      }
      
      public function get showModuleDialogs() : Object
      {
         return this.§_-52b§;
      }
      
      public function set showModuleDialogs(param1:Object) : void
      {
         if(this.§_-52b§ != param1)
         {
            this.§_-52b§ = param1;
            this.save();
         }
      }
   }
}

