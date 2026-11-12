package §_-BVP§
{
   import §_-0Uz§.§_-m3§;
   import §_-1t9§.§_-96c§;
   import §_-1x4§.FacebookAdapter;
   import §_-7-J§.§_-3tR§;
   import §_-7h2§.§_-49x§;
   import §_-8xR§.§_-0Ma§;
   import §_-9VF§.§_-5ab§;
   import §_-B9Y§.§_-1Ip§;
   import §_-B9Y§.§_-5p6§;
   import §_-GM§.Context;
   import §_-Wy§.§_-8of§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   import penzville.Config;
   
   public class §_-B1l§ extends §_-53f§ implements §_-m3§
   {
      private var §_-91Z§:Vector.<§_-49x§> = new Vector.<§_-49x§>();
      
      private var §_-7IV§:Vector.<§_-49x§> = new Vector.<§_-49x§>();
      
      private var _inited:Boolean = false;
      
      private var _netManager:§_-8of§ = null;
      
      public function §_-B1l§()
      {
         super();
         this._netManager = new §_-8of§();
         this._netManager.addEventListener(§_-5p6§.§_-TS§,this.§_-5ax§);
         this._netManager.addEventListener(§_-1Ip§.§_-AmJ§,this.§_-I§);
         this._netManager.addEventListener(§_-1Ip§.§_-3k4§,this.§_-CWE§);
         this._netManager.addEventListener(§_-1Ip§.§_-9jj§,this.§_-836§);
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      public function init() : void
      {
         this.§_-Bc6§();
      }
      
      public function get §_-85L§() : Vector.<§_-49x§>
      {
         return this.§_-91Z§;
      }
      
      public function get §_-co§() : Vector.<§_-49x§>
      {
         return this.§_-7IV§;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function §_-1iC§(param1:String, param2:String, param3:String) : void
      {
         this._netManager.§_-1iC§(param1,param2,param3);
      }
      
      public function §_-9BH§() : void
      {
         if(!this.§_-Bto§())
         {
            return;
         }
         this._netManager.§_-9BH§();
      }
      
      private function §_-I§(param1:§_-1Ip§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-5ab§ = null;
         var _loc4_:§_-0Ma§ = null;
         if(param1.message is §_-49x§ && param1.message.recipientId == Context.player.id)
         {
            this.§_-Bby§(param1.message);
            _loc2_ = null;
            _loc3_ = Context.§_-3B2§.§_-07a§(param1.message.senderId);
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.avatarAppearance.name;
            }
            _loc4_ = new §_-3tR§(Context.§_-5o8§.message("mailNewMessageTitle"),_loc2_,param1.message.text);
            Context.§_-BlB§.§_-CCK§(_loc4_);
            dispatchEvent(new §_-5p6§(§_-5p6§.§_-9GR§));
         }
      }
      
      private function §_-5ax§(param1:§_-5p6§) : void
      {
         var _loc2_:int = 0;
         if(param1.§_-85L§ != null)
         {
            this.§_-91Z§ = new Vector.<§_-49x§>();
            _loc2_ = 0;
            while(_loc2_ < param1.§_-85L§.length)
            {
               this.§_-91Z§.push(param1.§_-85L§[_loc2_]);
               _loc2_++;
            }
            dispatchEvent(new §_-5p6§(§_-5p6§.§_-9GR§));
         }
         if(param1.§_-co§ != null)
         {
            this.§_-7IV§ = new Vector.<§_-49x§>();
            _loc2_ = 0;
            while(_loc2_ < param1.§_-co§.length)
            {
               this.§_-7IV§.push(param1.§_-co§[_loc2_]);
               _loc2_++;
            }
            dispatchEvent(new §_-5p6§(§_-5p6§.§_-Nu§));
         }
         this._inited = true;
      }
      
      private function §_-CWE§(param1:§_-1Ip§) : void
      {
         if(param1.message is §_-49x§ && param1.message.senderId == Context.player.id)
         {
            this.§_-76Q§(param1.message);
            Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("mailLeaveMessageDialogTitle"),Context.§_-5o8§.message("mailLeaveMessageSuccess"));
            dispatchEvent(new §_-5p6§(§_-5p6§.§_-Nu§));
         }
         if(!param1.§_-B1x§ && Context.§_-2BT§.adapter is FacebookAdapter)
         {
            this.§_-6oJ§(param1.message as §_-49x§);
         }
      }
      
      private function §_-6oJ§(param1:§_-49x§) : void
      {
         var _loc2_:§_-96c§ = null;
         try
         {
            _loc2_ = new §_-96c§();
            _loc2_.type = §_-96c§.§_-6SG§;
            _loc2_.targetUserId = Context.§_-3B2§.§_-07a§(param1.recipientId).userInfo.socialId;
            _loc2_.title = Context.§_-5o8§.message("mailNewMessageTitle");
            _loc2_.description = Context.§_-5o8§.message("mailNewMessageText");
            Context.§_-2BT§.prepareSocialMedia(_loc2_,this.§_-1Tl§);
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-1Tl§(param1:§_-96c§) : void
      {
         var socialMedia:§_-96c§ = param1;
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         Context.§_-2BT§.publishSocialMedia(socialMedia,function():void
         {
         });
      }
      
      private function §_-836§(param1:§_-1Ip§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-85L§.length)
         {
            (this.§_-85L§[_loc2_] as §_-49x§).isNew = false;
            _loc2_++;
         }
         dispatchEvent(new §_-5p6§(§_-5p6§.§_-TS§));
      }
      
      private function §_-Bc6§() : void
      {
         this._netManager.§_-Bc6§();
      }
      
      private function §_-Bby§(param1:§_-49x§) : void
      {
         this.§_-91Z§.splice(0,0,param1);
      }
      
      private function §_-76Q§(param1:§_-49x§) : void
      {
         this.§_-7IV§.splice(0,0,param1);
      }
      
      public function §_-Bto§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-91Z§.length)
         {
            if(this.§_-91Z§[_loc1_].isNew)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-5p6§.§_-TS§,this.§_-5ax§);
            this._netManager.removeEventListener(§_-1Ip§.§_-AmJ§,this.§_-I§);
            this._netManager.removeEventListener(§_-1Ip§.§_-3k4§,this.§_-CWE§);
            this._netManager.removeEventListener(§_-1Ip§.§_-9jj§,this.§_-836§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

