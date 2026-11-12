package §_-9PR§
{
   import §_-0Q-§.§_-19y§;
   import §_-0Q-§.§_-6kT§;
   import §_-0Q-§.§_-9y2§;
   import §_-0Q-§.§_-QF§;
   import §_-0Uz§.§_-6v4§;
   import §_-1l5§.§_-4m-§;
   import §_-1l5§.§_-9Yj§;
   import §_-2qd§.§_-9ai§;
   import §_-45i§.§_-4We§;
   import §_-54O§.§_-1CJ§;
   import §_-54O§.§_-ArM§;
   import §_-54O§.§_-CM6§;
   import §_-5PB§.§_-3JU§;
   import §_-5PB§.§_-5hC§;
   import §_-6-L§.§_-49j§;
   import §_-7Gj§.§_-24r§;
   import §_-7Gj§.§_-3gi§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-5hc§;
   import §_-AKx§.§_-GN§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-Bwy§ extends §_-6v4§
   {
      private static const §_-4Cj§:String = "of.new";
      
      private static const §_-9ha§:String = "of.upd";
      
      private static const §_-AwS§:String = "of.cmpstp";
      
      private static const §_-9ko§:String = "of.rmv";
      
      private static const §_-7uJ§:String = "of.cmpoff";
      
      private static const §_-1Ir§:String = "of.aplmdf";
      
      public static const §_-AxI§:String = "venus";
      
      public static const OFFER_VENUS2:String = "venus2";
      
      public static const §_-9-v§:String = "c_and_c";
      
      public static const §_-3Uh§:String = "qiwi";
      
      public static const §_-2eJ§:String = "okQiwi";
      
      public static const §_-BXp§:String = "mmQiwi";
      
      public static const §_-CGP§:String = "camay";
      
      public static const §_-9K4§:String = "loreal";
      
      public static const §_-9Mu§:String = "rats";
      
      private static var _instance:§_-Bwy§ = null;
      
      private var _offers:Object = {};
      
      private var §_-CDB§:Object = {};
      
      private var §_-0X0§:Boolean = false;
      
      private var §_-8Nz§:Object = {};
      
      public function §_-Bwy§()
      {
         super();
         §_-1-t§(§_-4Cj§,this.§_-fq§);
         §_-1-t§(§_-9ha§,this.§_-BqV§);
         §_-1-t§(§_-9ko§,this.§_-1R0§);
         §_-1-t§(§_-7uJ§,this.§_-1hg§);
         §_-1-t§(§_-1Ir§,this.§_-AUU§);
      }
      
      public static function get instance() : §_-Bwy§
      {
         if(_instance == null)
         {
            _instance = new §_-Bwy§();
         }
         return _instance;
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-9Yj§ = null;
         for each(_loc2_ in param1.elements("offer"))
         {
            _loc3_ = new §_-9Yj§();
            _loc3_.configure(_loc2_);
            this.§_-CDB§[_loc3_.id] = _loc3_;
         }
      }
      
      public function get offers() : Object
      {
         return this._offers;
      }
      
      public function §_-2V6§(param1:String) : §_-4m-§
      {
         return !!this._offers.hasOwnProperty(param1) ? this._offers[param1] : null;
      }
      
      public function §_-3sJ§(param1:String) : §_-9Yj§
      {
         return !!this.§_-CDB§.hasOwnProperty(param1) ? this.§_-CDB§[param1] : null;
      }
      
      public function showOfferDialog(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:§_-4m-§ = this.§_-2V6§(param1);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:§_-GN§ = null;
         if(_loc5_.descriptor.scenario is §_-ArM§)
         {
            _loc6_ = (_loc5_.descriptor.scenario as §_-ArM§).createStepDialog(_loc5_,param4);
            if(_loc6_ is §_-9y2§ && !(_loc6_ as §_-9y2§).§_-RX§ && !param3)
            {
               _loc6_ = null;
            }
         }
         else
         {
            _loc6_ = new §_-6kT§(_loc5_,_loc5_.nextStep.order);
         }
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.addEventListener(§_-2-c§.§_-41T§,this.§_-ALH§);
         if(param2)
         {
            §_-5hc§.§_-57w§(_loc6_);
         }
         else
         {
            _loc6_.showModal();
         }
      }
      
      public function showAwardDialog(param1:String, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:§_-4m-§ = this.§_-2V6§(param1);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:§_-GN§ = null;
         if(_loc4_.descriptor.scenario is §_-ArM§)
         {
            _loc5_ = (_loc4_.descriptor.scenario as §_-ArM§).createAwardDialog(_loc4_);
            if(_loc5_ is §_-9y2§ && !(_loc5_ as §_-9y2§).§_-RX§ && !param3)
            {
               _loc5_ = null;
            }
         }
         else
         {
            _loc5_ = new §_-19y§(_loc4_);
         }
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.addEventListener(§_-2-c§.§_-41T§,this.§_-ALH§);
         if(param2)
         {
            §_-5hc§.§_-57w§(_loc5_);
         }
         else
         {
            _loc5_.showModal();
         }
      }
      
      private function §_-ALH§(param1:§_-2-c§) : void
      {
         var _loc3_:§_-4m-§ = null;
         var _loc4_:int = 0;
         var _loc5_:§_-24r§ = null;
         if(param1.§_-B66§.modalResult != §_-0jI§.§_-9qy§)
         {
            return;
         }
         var _loc2_:§_-QF§ = param1.§_-B66§ as §_-QF§;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.offer;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.descriptor.statDescriptor != null)
         {
            _loc3_.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-ABx§);
         }
         switch(_loc3_.descriptor.scenario.type)
         {
            case §_-CM6§.§_-5tR§:
               new §_-4We§(null,_loc3_.id).showModal();
               _loc3_.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-6dm§);
               break;
            case §_-CM6§.§_-2gq§:
               _loc4_ = (_loc3_.descriptor.scenario as §_-1CJ§).§_-8lE§;
               _loc5_ = _loc3_.descriptor.steps[_loc4_] as §_-24r§;
               if(_loc5_ != null)
               {
                  _loc5_.execute();
               }
               break;
            default:
               if(_loc3_.descriptor.getStep(_loc2_.§_-0PN§) != null)
               {
                  _loc3_.descriptor.getStep(_loc2_.§_-0PN§).execute();
               }
         }
      }
      
      public function §_-3hI§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4m-§ = this.§_-2V6§(param1);
         if(_loc3_ == null || _loc3_.§_-qR§(param2))
         {
            return;
         }
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put("step",param2);
         _loc4_.put("offerId",param1);
         netClient.sendExtMessage(§_-AwS§,_loc4_);
         dispatchEvent(new §_-bw§(§_-bw§.§_-1MQ§,_loc3_.id,param2));
      }
      
      public function §_-12t§(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var _loc5_:§_-4m-§ = this.§_-2V6§(param1);
         if(_loc5_ == null)
         {
            param4(null);
            return;
         }
         var _loc6_:String = param1 + ":" + param2;
         this.§_-8Nz§[_loc6_] = param4;
         var _loc7_:§_-4Ww§ = new §_-4Ww§();
         _loc7_.put("offerId",param1);
         _loc7_.put("modifier",param2);
         _loc7_.put("input",param3);
         netClient.sendExtMessage(§_-1Ir§,_loc7_);
      }
      
      private function §_-fq§(param1:§_-9ai§) : void
      {
         var offer:§_-4m-§ = null;
         var event:§_-9ai§ = param1;
         offer = event.data.§_-2jV§("offer",§_-4m-§);
         this.§_-0X0§ = event.data.has("tester") && event.data.getBoolean("tester");
         this.§_-5xI§(offer.id,function(param1:Boolean):void
         {
            if(param1)
            {
               _offers[offer.id] = offer;
               offer.validate();
               showOfferDialog(offer.id,true,false,true);
               if(offer.descriptor.statDescriptor != null)
               {
                  offer.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-0ES§);
               }
            }
         });
      }
      
      private function §_-BqV§(param1:§_-9ai§) : void
      {
         var _loc3_:§_-4Ww§ = null;
         var _loc4_:int = 0;
         var _loc2_:§_-4m-§ = param1.data.§_-2jV§("offer",§_-4m-§);
         if(this._offers.hasOwnProperty(_loc2_.id))
         {
            _loc3_ = new §_-4Ww§();
            _loc2_.toAGSObject(_loc3_);
            (this._offers[_loc2_.id] as §_-4m-§).fromAGSObject(_loc3_);
            _loc4_ = param1.data.getInt("dso",0);
            if(_loc4_ > 0 && _loc2_.descriptor.statDescriptor != null)
            {
               _loc2_.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-AJH§ + "_" + _loc4_);
            }
            if(_loc4_ > 0 && _loc2_.descriptor.getStep(_loc4_) is §_-3gi§)
            {
               this.showAwardDialog(_loc2_.id,true);
            }
            else
            {
               this.showOfferDialog(_loc2_.id,true,false);
            }
         }
      }
      
      private function §_-1R0§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString("id");
         this.removeOffer(_loc2_);
      }
      
      private function removeOffer(param1:String) : void
      {
         if(this._offers.hasOwnProperty(param1))
         {
            delete this._offers[param1];
         }
         dispatchEvent(new §_-bw§(§_-bw§.§_-Am1§,param1));
      }
      
      private function §_-1hg§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4m-§ = this.§_-2V6§(param1.data.getString("id"));
         if(_loc2_ == null)
         {
            return;
         }
         this.removeOffer(_loc2_.id);
      }
      
      private function §_-AUU§(param1:§_-9ai§) : void
      {
         var _loc6_:Function = null;
         var _loc2_:String = param1.data.getString("offerId");
         var _loc3_:String = param1.data.getString("modifier");
         var _loc4_:String = _loc2_ + ":" + _loc3_;
         var _loc5_:§_-4m-§ = this.§_-2V6§(_loc2_);
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.fromAGSObject(param1.data.§_-ANw§("offer"));
         if(this.§_-8Nz§.hasOwnProperty(_loc4_))
         {
            _loc6_ = this.§_-8Nz§[_loc4_];
            delete this.§_-8Nz§[_loc4_];
            _loc6_(_loc5_);
         }
      }
      
      public function §_-5xI§(param1:String, param2:Function) : void
      {
         var offerId:String = param1;
         var callback:Function = param2;
         var descriptor:§_-9Yj§ = this.§_-3sJ§(offerId);
         if(descriptor == null)
         {
            callback(false);
            return;
         }
         if(descriptor.statDescriptor == null)
         {
            callback(true);
            return;
         }
         this.initServices(§_-49j§.clone(descriptor.statDescriptor.services),function(param1:Boolean):void
         {
            callback(param1);
         });
      }
      
      private function initServices(param1:Array, param2:Function, param3:Boolean = true) : void
      {
         var service:§_-3JU§;
         var services:Array = param1;
         var callback:Function = param2;
         var success:Boolean = param3;
         if(services.length == 0 || !success)
         {
            callback(success);
            return;
         }
         service = services.shift();
         if(!service.valid)
         {
            this.initServices(services,callback,success);
         }
         else
         {
            service.init(this.§_-0X0§,function(param1:Boolean):void
            {
               initServices(services,callback,param1);
            });
         }
      }
   }
}

