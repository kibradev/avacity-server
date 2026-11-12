package §_-39l§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-0uA§.§_-3YE§;
   import §_-18o§.§_-4Qf§;
   import §_-1sb§.§_-2xb§;
   import §_-2U3§.ResourceManager;
   import §_-2Y7§.ClanMainDialog;
   import §_-2Y7§.§_-98H§;
   import §_-2Y7§.§_-ASC§;
   import §_-2Y7§.§_-BDS§;
   import §_-2qd§.§_-9ai§;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-3vi§.§_-2Xc§;
   import §_-3vi§.§_-3pa§;
   import §_-3vi§.§_-40D§;
   import §_-3vi§.§_-93u§;
   import §_-3vi§.§_-AdA§;
   import §_-3vi§.§_-BuY§;
   import §_-45g§.§_-CKP§;
   import §_-52p§.§_-25R§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-1nw§;
   import §_-5Zh§.§_-B7c§;
   import §_-7w5§.§_-0kt§;
   import §_-7w5§.§_-6J2§;
   import §_-7w5§.§_-AGs§;
   import §_-8Cv§.§_-3Wc§;
   import §_-8Hp§.§_-5KD§;
   import §_-9Nd§.§_-3iv§;
   import §_-A2M§.§_-4Ba§;
   import §_-AFi§.§_-9el§;
   import §_-AKx§.§_-4OH§;
   import §_-BIp§.§_-4Wl§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.DropShadowFilter;
   
   public class §_-5t6§ extends §_-6v4§
   {
      private static var _instance:§_-5t6§;
      
      public static const §_-48u§:String = "@clan";
      
      public static const §_-4Bd§:String = "clans";
      
      public static const §_-2IF§:String = "clanLocationEdit";
      
      public static const §_-9yd§:String = "clanEdit";
      
      public static const §_-7w4§:String = "clanShop";
      
      public static const §_-3AR§:String = "clanContest";
      
      public static const §_-3uv§:String = "clanChallenge";
      
      public static const §_-6Tc§:String = "clanChallengeRating";
      
      public static const §_-AD6§:String = "clanLeague";
      
      public static const §_-5sn§:int = 1;
      
      public static const §_-A4I§:int = 0;
      
      private static const §_-51c§:String = "grcm";
      
      private static const §_-8PT§:String = "gcibct";
      
      private static const §_-6HX§:String = "gcids";
      
      private var §_-7Pt§:Object = {};
      
      private var §_-1Bp§:Array;
      
      private var §_-6bh§:int;
      
      private var §_-3lB§:int;
      
      private var §_-BMQ§:int;
      
      private var §_-87Z§:int;
      
      private var §_-7UI§:int;
      
      private var §_-8BU§:Boolean;
      
      private var §_-9Q§:§_-93u§;
      
      private var §_-79m§:Array;
      
      private var §_-0J4§:Array;
      
      private var §_-4A-§:Array;
      
      private var §_-2SJ§:Array;
      
      private var §_-4dO§:Array;
      
      private var §_-7BP§:int;
      
      private var §_-CAm§:Object = {};
      
      private var §_-ARk§:Object = {};
      
      private var _currentClanLoaded:Boolean = false;
      
      private var §_-C7v§:Object = {};
      
      private var §_-5IZ§:int;
      
      private var §_-6N3§:int;
      
      private var §_-9iE§:int;
      
      private var §_-5Y-§:int;
      
      public function §_-5t6§()
      {
         super();
         §_-1-t§(§_-0kt§.§_-8RK§,this.onCreateClan);
         §_-1-t§(§_-0kt§.§_-qh§,this.§_-9z-§);
         §_-1-t§(§_-0kt§.§_-6ZP§,this.onVerifyPinCode);
         §_-1-t§(§_-0kt§.§_-BwH§,this.§_-5h5§);
         §_-1-t§(§_-0kt§.§_-2gd§,this.§_-5kk§);
         §_-1-t§(§_-0kt§.§_-8Ky§,this.§_-CWf§);
         §_-1-t§(§_-0kt§.§_-862§,this.§_-cl§);
         §_-1-t§(§_-0kt§.§_-CQt§,this.§_-7L-§);
         §_-1-t§(§_-0kt§.§_-4BS§,this.§_-CV6§);
         §_-1-t§(§_-0kt§.§_-3-4§,this.§_-1rp§);
         §_-1-t§(§_-0kt§.§_-3kl§,this.§_-1rp§);
         §_-1-t§(§_-0kt§.§_-Bbi§,this.§_-5wq§);
         §_-1-t§(§_-0kt§.§_-js§,this.§_-AIo§);
         §_-1-t§(§_-0kt§.§_-15X§,this.§_-9e5§);
         §_-1-t§(§_-0kt§.§_-4cv§,this.§_-9e5§);
         §_-1-t§(§_-0kt§.§_-Btj§,this.§_-9e5§);
         §_-1-t§(§_-0kt§.ERROR,this.§_-9ef§);
         §_-5KD§.instance.addEventListener(§_-3Wc§.§_-2Sq§,this.§_-8hW§);
      }
      
      public static function get instance() : §_-5t6§
      {
         if(_instance == null)
         {
            _instance = new §_-5t6§();
         }
         return _instance;
      }
      
      private function §_-8hW§(param1:§_-3Wc§) : void
      {
         if(!this.isActive())
         {
            return;
         }
         if(Context.cityPlayer.clanInfo != null)
         {
            Context.§_-CJo§.§_-9ui§(Context.cityPlayer.clanInfo.clanId);
            this.loadCurrentClan();
            if(!Context.§_-5OZ§.inited)
            {
               Context.§_-5OZ§.§_-Aw2§();
            }
            if(Context.§_-Bb2§.§_-6Iv§() || Context.§_-Bb2§.§_-0be§())
            {
               Context.§_-Bb2§.getClanActivity();
            }
         }
         else
         {
            Context.§_-CJo§.§_-BtI§(parseInt(Context.cityPlayer.id));
         }
      }
      
      public function configure(param1:XML) : void
      {
         var levelConfig:XML = null;
         var logoConfig:XML = null;
         var locationConfig:XML = null;
         var chestConfig:XML = null;
         var roomPrice:XML = null;
         var edit:XML = null;
         var descriptor:§_-3pa§ = null;
         var logoDescriptor:§_-2Xc§ = null;
         var locationDescriptor:§_-AdA§ = null;
         var chestLevelDescriptor:§_-BuY§ = null;
         var number:int = 0;
         var coinPrice:int = 0;
         var xml:XML = param1;
         var params:XML = xml["params"][0];
         this.§_-6bh§ = !!params.hasOwnProperty("@joinMinLevel") ? int(params["@joinMinLevel"]) : 0;
         if(this.§_-6bh§ <= 0)
         {
            §_-3YE§.§_-7aK§("join min level is null");
         }
         this.§_-3lB§ = !!params.hasOwnProperty("@donateFactor") ? int(params["@donateFactor"]) : 0;
         this.§_-BMQ§ = !!params.hasOwnProperty("@clanLocationLockPriceInCoins") ? int(params["@clanLocationLockPriceInCoins"]) : 0;
         this.§_-87Z§ = !!params.hasOwnProperty("@clanLocationLockTimeInHours") ? int(params["@clanLocationLockTimeInHours"]) : 0;
         this.§_-7UI§ = !!params.hasOwnProperty("@clanChestMinLevel") ? int(params["@clanChestMinLevel"]) : 0;
         if(this.§_-6bh§ <= 0)
         {
            §_-3YE§.§_-7aK§("donate factor is null");
         }
         this.§_-9Q§ = new §_-93u§();
         this.§_-9Q§.configure(xml["newClan"][0]);
         this.§_-1Bp§ = [];
         for each(levelConfig in (xml.elements("levels")[0] as XML).elements("level"))
         {
            descriptor = new §_-3pa§();
            descriptor.configure(levelConfig);
            this.§_-1Bp§.push(descriptor);
         }
         this.§_-1Bp§.sort(function(param1:§_-3pa§, param2:§_-3pa§):int
         {
            return param1.id < param2.id ? -1 : 1;
         });
         this.§_-79m§ = [];
         for each(logoConfig in (xml.elements("logos")[0] as XML).elements("logo"))
         {
            logoDescriptor = new §_-2Xc§();
            logoDescriptor.configure(logoConfig);
            this.§_-79m§.push(logoDescriptor);
         }
         this.§_-0J4§ = [];
         for each(locationConfig in (xml.elements("roomDesigns")[0] as XML).elements("roomDesign"))
         {
            locationDescriptor = new §_-AdA§();
            locationDescriptor.configure(locationConfig);
            this.§_-0J4§.push(locationDescriptor);
         }
         this.§_-4A-§ = [];
         for each(chestConfig in (xml.elements("chestsAwards")[0] as XML).elements("chests"))
         {
            chestLevelDescriptor = new §_-BuY§();
            chestLevelDescriptor.configure(chestConfig);
            this.§_-4A-§.push(chestLevelDescriptor);
         }
         for each(roomPrice in (xml.elements("roomPrices")[0] as XML).elements("room"))
         {
            number = !!roomPrice.hasOwnProperty("@number") ? int(roomPrice["@number"]) : 0;
            coinPrice = !!roomPrice.hasOwnProperty("@coinPrice") ? int(roomPrice["@coinPrice"]) : 0;
            if(number > 0 && coinPrice > 0)
            {
               this.§_-C7v§[number] = coinPrice;
               this.§_-5IZ§ = coinPrice > this.§_-5IZ§ ? coinPrice : this.§_-5IZ§;
            }
         }
         edit = xml["edit"][0];
         this.§_-6N3§ = !!edit.hasOwnProperty("@changeNamePrice") ? int(edit["@changeNamePrice"]) : 0;
         this.§_-9iE§ = !!edit.hasOwnProperty("@changeTagPrice") ? int(edit["@changeTagPrice"]) : 0;
         this.§_-5Y-§ = !!edit.hasOwnProperty("@changeLogoPrice") ? int(edit["@changeLogoPrice"]) : 0;
      }
      
      public function get §_-qf§() : int
      {
         return this.§_-6bh§;
      }
      
      public function get §_-2W2§() : int
      {
         return this.§_-9Q§.§_-0y5§;
      }
      
      public function get §_-14t§() : §_-93u§
      {
         return this.§_-9Q§;
      }
      
      public function §_-0cO§(param1:int) : Array
      {
         var _loc2_:§_-BuY§ = null;
         for each(_loc2_ in this.§_-4A-§)
         {
            if(_loc2_.level == param1)
            {
               return _loc2_.§_-7Y-§;
            }
         }
         return null;
      }
      
      public function §_-jm§(param1:String) : §_-19w§
      {
         return !!this.§_-7Pt§.hasOwnProperty(param1) ? this.§_-7Pt§[param1] : null;
      }
      
      public function get §_-7fX§() : int
      {
         return this.§_-3lB§;
      }
      
      public function get §_-B5J§() : int
      {
         return this.§_-BMQ§;
      }
      
      public function get §_-5xe§() : int
      {
         return this.§_-87Z§;
      }
      
      public function get §_-0pa§() : int
      {
         return this.§_-7UI§;
      }
      
      public function get §_-4SJ§() : int
      {
         return this.§_-6N3§;
      }
      
      public function get §_-9HY§() : int
      {
         return this.§_-9iE§;
      }
      
      public function get §_-Bcw§() : int
      {
         return this.§_-5Y-§;
      }
      
      public function §_-0zK§(param1:int) : §_-40D§
      {
         var _loc2_:§_-3pa§ = this.§_-1FR§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.§_-AYn§;
         }
         return null;
      }
      
      public function §_-1FR§(param1:int) : §_-3pa§
      {
         var _loc2_:§_-3pa§ = null;
         for each(_loc2_ in this.§_-1Bp§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-99n§() : Number
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in §_-0nG§.instance.§_-2bV§())
         {
            if(_loc1_ is §_-9el§ && _loc1_.isActive())
            {
               return (_loc1_ as §_-9el§).§_-99n§();
            }
         }
         return 1;
      }
      
      public function isActive() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-4Bd§);
      }
      
      public function §_-CR4§() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-9yd§);
      }
      
      public function §_-8jq§(param1:int) : int
      {
         var _loc2_:int = param1 + 1;
         return !!this.§_-C7v§.hasOwnProperty(param1 + 1) ? int(this.§_-C7v§[_loc2_]) : this.§_-5IZ§;
      }
      
      public function §_-Lc§() : Boolean
      {
         return this.isActive() && §_-5KD§.instance.§_-C6D§(§_-7w4§);
      }
      
      public function §_-3aU§() : Boolean
      {
         return this.isActive() && §_-5KD§.instance.§_-C6D§(§_-3AR§);
      }
      
      public function §_-9mn§() : Boolean
      {
         return this.isActive() && §_-5KD§.instance.§_-C6D§(§_-3uv§);
      }
      
      public function §_-72F§() : Boolean
      {
         return this.isActive() && §_-5KD§.instance.§_-C6D§(§_-AD6§);
      }
      
      public function §_-K8§() : Boolean
      {
         if(this.§_-1Bp§ == null || this.§_-1Bp§.length <= 0)
         {
            return false;
         }
         return Context.player.level >= (this.§_-1Bp§[0] as §_-3pa§).§_-AYn§.§_-0y5§ || Context.cityPlayer.clanInfo != null;
      }
      
      public function §_-5Dg§(param1:int) : §_-19w§
      {
         if(this.§_-7Pt§.hasOwnProperty(String(param1)))
         {
            return this.§_-7Pt§[param1];
         }
         return null;
      }
      
      public function §_-8JN§(param1:int) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var clanId:int = param1;
         if(this.§_-7Pt§.hasOwnProperty(clanId.toString()))
         {
            return §_-4Ba§.resolve(this.§_-7Pt§[clanId]);
         }
         task = new §_-4Ba§();
         this.§_-pr§(clanId,"loadClanModel_" + clanId,function(param1:Array):void
         {
            task.resolve(param1[0]);
         });
         return task;
      }
      
      public function §_-31X§(param1:String, param2:int) : MovieClip
      {
         var _loc3_:MovieClip = ResourceManager.createMovieClip("ClanIconsAsset@ui");
         _loc3_.gotoAndStop(param1);
         var _loc4_:int = int(this.§_-7Tl§(param2));
         if(_loc4_ != 0)
         {
            §_-4Qf§.colorize(_loc3_,[_loc4_]);
         }
         _loc3_.filters = [new DropShadowFilter(3,45,0,1,2,2,0.35,BitmapFilterQuality.HIGH)];
         return _loc3_;
      }
      
      public function §_-C0o§(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = ResourceManager.createMovieClip("BigClanLogoAsset" + §_-48u§);
         _loc2_.gotoAndStop(param1);
         return _loc2_;
      }
      
      public function §_-Aez§(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = ResourceManager.createMovieClip("ClanLocationCaseIconAsset" + §_-48u§);
         _loc2_.gotoAndStop(param1);
         return _loc2_;
      }
      
      public function §_-B2V§(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = ResourceManager.createMovieClip("ClanLocationSmallIconAsset" + §_-48u§);
         _loc2_.gotoAndStop(param1);
         return _loc2_;
      }
      
      public function §_-1wm§(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = ResourceManager.createMovieClip("RoomListClanLocationIconsAsset" + §_-48u§);
         _loc2_.gotoAndStop(param1);
         return _loc2_;
      }
      
      public function §_-9Gh§(param1:String, param2:Function) : void
      {
         new §_-ASC§(Context.§_-5o8§.message("clanLocationSelectTitle"),param1,param2).showModal();
      }
      
      public function get §_-2mm§() : Array
      {
         return this.§_-79m§;
      }
      
      public function get §_-CMP§() : Array
      {
         return this.§_-0J4§;
      }
      
      public function §_-B2F§(param1:String) : Boolean
      {
         return Context.§_-CJo§.§_-Ax8§(param1);
      }
      
      public function §_-7pT§(param1:String) : Boolean
      {
         return Context.§_-3B2§.§_-07a§(param1).level >= this.§_-6bh§;
      }
      
      public function createClan(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         var _loc6_:§_-4Ww§ = new §_-4Ww§();
         _loc6_.putString(§_-6J2§.§_-CRc§,param1);
         _loc6_.putString(§_-6J2§.§_-5Q0§,param2);
         _loc6_.putString(§_-6J2§.§_-A6p§,param3);
         _loc6_.putString(§_-6J2§.§_-77f§,param4);
         _loc6_.putString(§_-6J2§.§_-81J§,param5);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-8RK§,_loc6_);
      }
      
      public function dismissClan(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-6J2§.§_-81J§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-862§,_loc2_);
      }
      
      public function verifyPinCode(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-6J2§.§_-81J§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-6ZP§,_loc2_);
      }
      
      public function changePinCode(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-6J2§.§_-81J§,param2);
         _loc3_.putString(§_-6J2§.§_-1Uw§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-BwH§,_loc3_);
      }
      
      public function §_-75p§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-6J2§.§_-9-4§,param1);
         _loc3_.§_-6YJ§(§_-6J2§.§_-1Wq§,param2);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-5eB§,_loc3_);
      }
      
      public function §_-7Vt§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-6J2§.§_-BUG§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-9BL§,_loc2_);
      }
      
      public function §_-AJn§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-6J2§.§_-BUG§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-C2F§,_loc2_);
      }
      
      public function §_-6Hb§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-6J2§.§_-BUG§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-1Hw§,_loc2_);
      }
      
      public function §_-7iC§(param1:§_-25R§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6JD§(§_-6J2§.§_-5L1§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-qh§,_loc2_);
      }
      
      public function §_-5nA§(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§(§_-6J2§.§_-CRc§,param1);
         _loc3_.putString(§_-6J2§.§_-81J§,param2);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-15X§,_loc3_);
      }
      
      public function §_-5n8§(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§(§_-6J2§.§_-5Q0§,param1);
         _loc3_.putString(§_-6J2§.§_-81J§,param2);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-4cv§,_loc3_);
      }
      
      public function §_-9SH§(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§(§_-6J2§.§_-A6p§,param1);
         _loc3_.putString(§_-6J2§.§_-81J§,param2);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-Btj§,_loc3_);
      }
      
      public function openMainDialog(param1:int = -1) : void
      {
         if(!this.isActive() || this.§_-0Ld§(param1,Context.cityPlayer.id))
         {
            return;
         }
         var _loc2_:ClanMainDialog = new ClanMainDialog(param1);
         _loc2_.showModal(null,true);
      }
      
      public function loadCurrentClan() : void
      {
         this.§_-pr§(Context.cityPlayer.clanInfo.clanId,"loadCurrentClan",function():void
         {
            _currentClanLoaded = true;
         });
      }
      
      public function §_-6JB§(param1:String, param2:Function) : void
      {
         this.addCallback(param1,param2);
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-3mj§.§_-3aT§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-3-4§,_loc3_);
      }
      
      public function §_-EF§(param1:String, param2:String, param3:Function) : void
      {
         this.addCallback(param2,param3);
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-3mj§.§_-3aT§,param2);
         _loc4_.putString(§_-6J2§.§_-CRc§,param1);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-3kl§,_loc4_);
      }
      
      public function §_-8dV§() : void
      {
         §_-6gl§.sendExtMessage(§_-0kt§.§_-js§);
      }
      
      public function §_-pr§(param1:int, param2:String, param3:Function) : void
      {
         this.§_-733§([param1],param2,param3);
      }
      
      public function §_-733§(param1:Array, param2:String, param3:Function) : void
      {
         var _loc6_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in param1)
         {
            if(this.§_-7Pt§.hasOwnProperty(_loc6_.toString()))
            {
               _loc4_.push(this.§_-7Pt§[_loc6_]);
            }
            else
            {
               _loc5_.push(_loc6_);
            }
         }
         if(_loc5_.length == 0)
         {
            param3(_loc4_);
            return;
         }
         if(!this.addCallback(param2,param3))
         {
            return;
         }
         this.§_-ARk§[param2] = _loc4_;
         var _loc7_:§_-4Ww§ = new §_-4Ww§();
         _loc7_.putString(§_-3mj§.§_-3aT§,param2);
         _loc7_.§_-3f6§(§_-6J2§.§_-CMe§,_loc5_);
         §_-6gl§.sendExtMessage(§_-0kt§.§_-Bbi§,_loc7_);
      }
      
      public function §_-6js§(param1:String, param2:Function) : void
      {
         this.§_-EF§(param1,§_-8PT§,param2);
      }
      
      public function §_-2lD§(param1:Function) : void
      {
         this.§_-6JB§(§_-51c§,param1);
      }
      
      public function updateClan(param1:§_-19w§) : void
      {
         if(!this.§_-7Pt§.hasOwnProperty(String(param1.id)))
         {
            this.§_-7Pt§[param1.id] = null;
         }
         this.§_-7Pt§[param1.id] = param1;
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-6so§);
         _loc2_.§_-5aN§(§_-CKP§.§_-07y§,this.§_-7Pt§[param1.id]);
         dispatchEvent(_loc2_);
      }
      
      public function §_-BZe§(param1:§_-19w§) : void
      {
         var _loc2_:§_-CKP§ = null;
         if(this.§_-7Pt§.hasOwnProperty(String(param1.id)))
         {
            delete this.§_-7Pt§[param1.id];
            _loc2_ = new §_-CKP§(§_-CKP§.§_-VX§);
            _loc2_.§_-5aN§(§_-CKP§.§_-07y§,param1);
            dispatchEvent(_loc2_);
         }
      }
      
      private function §_-7Tl§(param1:int) : uint
      {
         var _loc2_:§_-3pa§ = this.§_-1FR§(param1);
         return _loc2_ != null ? uint(_loc2_.color) : 0;
      }
      
      public function §_-BgL§(param1:§_-1nw§) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            §_-3YE§.error("clan info is null");
            return;
         }
         if(!this.§_-7Pt§.hasOwnProperty(String(Context.cityPlayer.clanInfo.clanId)))
         {
            return;
         }
         (this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).addMember(param1);
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-04E§);
         _loc2_.§_-5aN§(§_-CKP§.§_-4W7§,param1);
         dispatchEvent(_loc2_);
         if(Context.cityPlayer.id == param1.userId.toString())
         {
            new §_-98H§(this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).showModal();
         }
      }
      
      public function §_-APT§(param1:int) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            §_-3YE§.error("clan info is null");
            return;
         }
         if(!this.§_-7Pt§.hasOwnProperty(String(Context.cityPlayer.clanInfo.clanId)))
         {
            return;
         }
         (this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).§_-A8I§(param1);
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-5zj§);
         _loc2_.§_-5aN§(§_-CKP§.§_-9IR§,(this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).members);
         dispatchEvent(_loc2_);
      }
      
      private function §_-9ef§(param1:§_-9ai§) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.data.getInt(§_-3iv§.§_-0JN§,0);
         if(_loc2_ <= 0)
         {
            §_-3YE§.error("error code is null");
            return;
         }
         var _loc3_:String = "";
         switch(_loc2_)
         {
            case §_-AGs§.§_-68-§:
               _loc4_ = Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
               _loc3_ = Context.§_-5o8§.gender("clanError" + _loc2_,_loc4_);
               break;
            case §_-AGs§.§_-BtS§:
            case §_-AGs§.§_-Aiw§:
            case §_-AGs§.§_-5qA§:
            case §_-AGs§.§_-6fR§:
            case §_-AGs§.§_-7Mz§:
            case §_-AGs§.§_-2Uh§:
               _loc3_ = Context.§_-5o8§.message("clanError" + _loc2_);
               break;
            case §_-AGs§.§_-4Fv§:
               _loc3_ = Context.§_-5o8§.message("clanError" + _loc2_);
         }
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("clanDialogTitle"),_loc3_);
      }
      
      private function §_-CV6§(param1:§_-9ai§) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            §_-3YE§.error("clan info is null");
            return;
         }
         if(!this.§_-7Pt§.hasOwnProperty(String(Context.cityPlayer.clanInfo.clanId)))
         {
            return;
         }
         var _loc2_:String = param1.data.getString(§_-6J2§.§_-BUG§,null);
         if(_loc2_ == null)
         {
            return;
         }
         (this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).§_-5ir§(_loc2_);
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-5zj§);
         _loc3_.§_-5aN§(§_-CKP§.§_-9IR§,(this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).members);
         dispatchEvent(_loc3_);
      }
      
      private function §_-7L-§(param1:§_-9ai§) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            §_-3YE§.error("clan info is null");
            return;
         }
         if(!this.§_-7Pt§.hasOwnProperty(String(Context.cityPlayer.clanInfo.clanId)))
         {
            return;
         }
         var _loc2_:§_-1nw§ = param1.data.§_-2jV§(§_-6J2§.§_-5HK§,§_-1nw§);
         if(_loc2_ == null)
         {
            return;
         }
         (this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).updateMember(_loc2_);
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-5zj§);
         _loc3_.§_-5aN§(§_-CKP§.§_-9IR§,(this.§_-7Pt§[Context.cityPlayer.clanInfo.clanId] as §_-19w§).members);
         dispatchEvent(_loc3_);
      }
      
      private function §_-5kk§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-19w§ = param1.data.§_-2jV§(§_-6J2§.§_-dw§,§_-19w§);
         if(_loc2_ == null)
         {
            §_-3YE§.error("clan descriptor is null");
            return;
         }
         if(!this.§_-7Pt§.hasOwnProperty(String(_loc2_.id)))
         {
            return;
         }
         (this.§_-7Pt§[_loc2_.id] as §_-19w§).fromModel(_loc2_);
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-6so§);
         _loc3_.§_-5aN§(§_-CKP§.§_-07y§,this.§_-7Pt§[_loc2_.id]);
         dispatchEvent(_loc3_);
      }
      
      public function §_-CWf§(param1:§_-9ai§) : void
      {
         var _loc4_:§_-CKP§ = null;
         var _loc2_:int = param1.data.getInt(§_-6J2§.§_-5im§);
         var _loc3_:§_-19w§ = null;
         if(this.§_-7Pt§.hasOwnProperty(String(_loc2_)))
         {
            _loc3_ = this.§_-7Pt§[_loc2_];
            delete this.§_-7Pt§[_loc2_];
         }
         if(_loc3_ != null)
         {
            _loc4_ = new §_-CKP§(§_-CKP§.§_-VX§);
            _loc4_.§_-5aN§(§_-CKP§.§_-07y§,_loc3_);
            dispatchEvent(_loc4_);
         }
      }
      
      private function §_-cl§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.DISMISS_CLAN);
         _loc2_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         dispatchEvent(_loc2_);
      }
      
      private function §_-9z-§(param1:§_-9ai§) : void
      {
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("clanDialogTitle"),Context.§_-5o8§.message("clanDonateThanks"));
         dispatchEvent(new §_-CKP§(§_-CKP§.§_-6so§));
      }
      
      private function §_-5-9§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.§_-Bc6§(§_-6J2§.§_-3X4§,§_-B7c§);
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-MB§);
         _loc3_.§_-5aN§(§_-CKP§.§_-2Qe§,_loc2_);
         dispatchEvent(_loc3_);
      }
      
      private function onCreateClan(param1:§_-9ai§) : void
      {
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-Xb§);
         _loc2_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         _loc2_.§_-5aN§(§_-CKP§.§_-7EW§,param1.data.getInt(§_-6J2§.§_-6IK§));
         dispatchEvent(_loc2_);
         if(!param1.data.getBoolean(§_-3mj§.§_-2yH§))
         {
            return;
         }
         var _loc3_:§_-19w§ = param1.data.§_-2jV§(§_-6J2§.§_-dw§,§_-19w§);
         if(_loc3_ == null)
         {
            §_-3YE§.error("clan descriptor is null");
            return;
         }
         this.§_-7Pt§[_loc3_.id] = _loc3_;
         new §_-BDS§(_loc3_).showModal();
      }
      
      private function onVerifyPinCode(param1:§_-9ai§) : void
      {
         var _loc2_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-Bu8§);
         _loc2_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         dispatchEvent(_loc2_);
      }
      
      private function §_-5h5§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-19w§ = param1.data.§_-2jV§(§_-6J2§.§_-dw§,§_-19w§);
         if(_loc2_ != null && Boolean(this.§_-7Pt§.hasOwnProperty(String(_loc2_.id))))
         {
            (this.§_-7Pt§[_loc2_.id] as §_-19w§).§_-CID§ = _loc2_.§_-CID§;
         }
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.CHANGE_PIN_CODE);
         _loc3_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         dispatchEvent(_loc3_);
      }
      
      private function §_-AIo§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-19w§ = param1.data.§_-2jV§(§_-6J2§.§_-dw§,§_-19w§);
         if(_loc2_ != null && Boolean(this.§_-7Pt§.hasOwnProperty(String(_loc2_.id))))
         {
            (this.§_-7Pt§[_loc2_.id] as §_-19w§).§_-BVZ§ = _loc2_.§_-BVZ§;
         }
         var _loc3_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-9Yh§);
         _loc3_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         _loc3_.§_-5aN§(§_-CKP§.§_-07y§,_loc2_);
         dispatchEvent(_loc3_);
      }
      
      private function §_-9e5§(param1:§_-9ai§) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Boolean = param1.data.getBoolean(§_-3mj§.§_-2yH§);
         if(!_loc2_)
         {
            _loc5_ = param1.data.getInt(§_-6J2§.§_-6IK§);
            if(_loc5_ == §_-AGs§.§_-1Pu§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("editAction"),Context.§_-5o8§.message("clanPinCodeErrorDescription"));
            }
            if(_loc5_ == §_-AGs§.§_-Po§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("editAction"),Context.§_-5o8§.message("clanNameErrorDuplicateHintText"));
            }
            if(_loc5_ == §_-AGs§.§_-JZ§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("editAction"),Context.§_-5o8§.message("clanNameErrorHintText"));
            }
            if(_loc5_ == §_-AGs§.§_-BCO§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("editAction"),Context.§_-5o8§.message("clanTagErrorHintText"));
            }
            return;
         }
         var _loc3_:§_-19w§ = param1.data.§_-2jV§(§_-6J2§.§_-dw§,§_-19w§);
         if(_loc3_ != null && Boolean(this.§_-7Pt§.hasOwnProperty(String(_loc3_.id))))
         {
            (this.§_-7Pt§[_loc3_.id] as §_-19w§).§_-BVZ§ = _loc3_.§_-BVZ§;
         }
         Context.§_-BlB§.§_-CCK§(new §_-4Wl§(§_-4Wl§.§_-7G1§,_loc3_));
         var _loc4_:§_-CKP§ = new §_-CKP§(§_-CKP§.§_-3lm§);
         _loc4_.§_-5aN§(§_-CKP§.§_-Bs0§,param1.data.getBoolean(§_-3mj§.§_-2yH§));
         _loc4_.§_-5aN§(§_-CKP§.§_-07y§,_loc3_);
         dispatchEvent(_loc4_);
         dispatchEvent(new §_-CKP§(§_-CKP§.§_-6so§));
      }
      
      private function §_-5wq§(param1:§_-9ai§) : void
      {
         var _loc5_:§_-19w§ = null;
         var _loc2_:String = param1.data.getString(§_-3mj§.§_-3aT§);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Array = param1.data.§_-Bc6§(§_-6J2§.§_-2u8§,§_-19w§);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = [];
         if(this.§_-ARk§.hasOwnProperty(_loc2_))
         {
            _loc4_ = this.§_-ARk§[_loc2_];
            delete this.§_-ARk§[_loc2_];
         }
         for each(_loc5_ in _loc3_)
         {
            _loc4_.push(_loc5_);
            this.§_-7Pt§[_loc5_.id] = _loc5_;
         }
         this.invokeCallbacks(_loc2_,_loc4_);
      }
      
      private function §_-1rp§(param1:§_-9ai§) : void
      {
         var ids:Array;
         var callId:String = null;
         var event:§_-9ai§ = param1;
         callId = event.data.getString(§_-3mj§.§_-3aT§);
         if(callId == null)
         {
            return;
         }
         ids = event.data.§_-Bc6§(§_-6J2§.§_-CMe§,int);
         if(ids == null)
         {
            return;
         }
         this.§_-733§(ids,§_-6HX§,function(param1:Array):void
         {
            invokeCallbacks(callId,param1);
         });
      }
      
      public function getClanActivity(param1:int) : int
      {
         return 0;
      }
      
      public function §_-15W§(param1:int) : int
      {
         return 0;
      }
      
      public function §_-49m§(param1:§_-19w§) : Boolean
      {
         var _loc2_:§_-3pa§ = null;
         for each(_loc2_ in this.§_-1Bp§)
         {
            if(_loc2_.id == param1.level)
            {
               return param1.§_-AH8§ >= _loc2_.§_-2oA§;
            }
         }
         return true;
      }
      
      public function §_-1lf§(param1:§_-19w§) : Boolean
      {
         var _loc2_:§_-3pa§ = null;
         for each(_loc2_ in this.§_-1Bp§)
         {
            if(_loc2_.id == param1.level)
            {
               return param1.§_-AH8§ > _loc2_.§_-2oA§;
            }
         }
         return true;
      }
      
      public function §_-0Ld§(param1:int, param2:String) : Boolean
      {
         var _loc3_:§_-19w§ = this.§_-5Dg§(param1);
         return _loc3_ != null && _loc3_.§_-0Ld§(param2);
      }
      
      private function addCallback(param1:String, param2:Function) : Boolean
      {
         if(!this.§_-CAm§.hasOwnProperty(param1))
         {
            this.§_-CAm§[param1] = [param2];
            return true;
         }
         (this.§_-CAm§[param1] as Array).push(param2);
         return false;
      }
      
      private function invokeCallbacks(param1:String, param2:Object) : void
      {
         var _loc4_:Function = null;
         if(!this.§_-CAm§.hasOwnProperty(param1))
         {
            return;
         }
         var _loc3_:Array = this.§_-CAm§[param1] as Array;
         for each(_loc4_ in _loc3_)
         {
            _loc4_(param2);
         }
         delete this.§_-CAm§[param1];
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         §_-5KD§.instance.removeEventListener(§_-3Wc§.§_-2Sq§,this.§_-8hW§);
         super.destroy();
      }
   }
}

