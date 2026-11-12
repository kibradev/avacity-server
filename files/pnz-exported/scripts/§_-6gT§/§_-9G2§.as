package §_-6gT§
{
   import §_-02i§.§_-Br7§;
   import §_-0Uz§.§_-6v4§;
   import §_-2bP§.§_-4zT§;
   import §_-2qd§.§_-9ai§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-9G2§ extends §_-6v4§
   {
      private var §_-CAm§:Object = {};
      
      private var _inited:Boolean = false;
      
      private var §_-3zu§:Boolean = false;
      
      private var §_-0pM§:Object = null;
      
      public function §_-9G2§()
      {
         super();
         §_-1-t§(§_-4Re§.INIT,this.onInit);
         §_-1-t§(§_-4Re§.§_-4H7§,this.§_-5rh§);
         §_-1-t§(§_-4Re§.§_-7up§,this.§_-sI§);
         §_-1-t§(§_-4Re§.§_-4gu§,this.§_-8xl§);
         §_-1-t§(§_-4Re§.§_-1VF§,this.§_-6as§);
         §_-1-t§(§_-4Re§.§_-ALw§,this.§_-8Z9§);
         §_-1-t§(§_-4Re§.§_-BnZ§,this.§_-zy§);
      }
      
      public function init(param1:Function) : void
      {
         if(this._inited)
         {
            param1();
            return;
         }
         this.§_-CAm§["init"] = param1;
         §_-6gl§.sendExtMessage(§_-4Re§.INIT);
      }
      
      public function getTickets() : void
      {
         §_-6gl§.sendExtMessage(§_-4Re§.§_-4H7§);
      }
      
      public function getTicket(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-22u§.§_-5ao§,param1);
         §_-6gl§.sendExtMessage(§_-4Re§.§_-7up§,_loc2_);
      }
      
      public function createTicket(param1:String, param2:String, param3:int) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-22u§.TITLE,param1);
         _loc4_.put(§_-22u§.§_-1Ei§,param2);
         _loc4_.put(§_-22u§.§_-AL1§,param3);
         §_-6gl§.sendExtMessage(§_-4Re§.§_-4gu§,_loc4_);
      }
      
      public function closeTicket(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-22u§.§_-5ao§,param1);
         §_-6gl§.sendExtMessage(§_-4Re§.§_-BnZ§,_loc2_);
      }
      
      public function addTicketReply(param1:String, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-22u§.§_-5ao§,param1);
         _loc3_.put(§_-22u§.§_-1Ei§,param2);
         §_-6gl§.sendExtMessage(§_-4Re§.§_-ALw§,_loc3_);
      }
      
      private function onInit(param1:§_-9ai§) : void
      {
         var _loc2_:Function = null;
         this._inited = true;
         this.§_-3zu§ = param1.data.getBoolean(§_-22u§.ACTIVE);
         if(param1.data.has(§_-22u§.§_-1FS§))
         {
            this.§_-0pM§ = param1.data.getMap(§_-22u§.§_-1FS§,String);
         }
         else
         {
            this.§_-0pM§ = {};
         }
         if(this.§_-CAm§.hasOwnProperty("init"))
         {
            _loc2_ = this.§_-CAm§["init"];
            delete this.§_-CAm§["init"];
            _loc2_();
         }
      }
      
      private function §_-5rh§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.§_-Bc6§(§_-22u§.§_-IJ§,§_-4zT§);
         var _loc3_:§_-8Ml§ = new §_-8Ml§(§_-8Ml§.§_-4H7§);
         _loc3_.§_-5aN§(§_-22u§.§_-IJ§,_loc2_);
         dispatchEvent(_loc3_);
      }
      
      private function §_-sI§(param1:§_-9ai§) : void
      {
         var _loc3_:§_-8Ml§ = null;
         var _loc2_:§_-4zT§ = param1.data.§_-2jV§(§_-22u§.§_-7jn§,§_-4zT§);
         if(_loc2_ != null)
         {
            _loc3_ = new §_-8Ml§(§_-8Ml§.§_-7up§);
            _loc3_.§_-5aN§(§_-22u§.§_-7jn§,_loc2_);
            dispatchEvent(_loc3_);
         }
      }
      
      private function §_-8xl§(param1:§_-9ai§) : void
      {
         var _loc2_:String = Context.§_-5o8§.message("createTicket");
         var _loc3_:String = Context.§_-5o8§.message("createTicketComplete");
         Context.§_-BlB§.§_-5eA§(_loc2_,_loc3_);
      }
      
      private function §_-8Z9§(param1:§_-9ai§) : void
      {
         var _loc2_:String = Context.§_-5o8§.message("addTicketReply");
         var _loc3_:String = Context.§_-5o8§.message("addTicketReplyComplete");
         Context.§_-BlB§.§_-5eA§(_loc2_,_loc3_);
      }
      
      private function §_-zy§(param1:§_-9ai§) : void
      {
         var _loc2_:String = Context.§_-5o8§.message("cancelTicket");
         var _loc3_:String = Context.§_-5o8§.message("cancelTicketComplete");
         Context.§_-BlB§.§_-5eA§(_loc2_,_loc3_);
      }
      
      private function §_-6as§(param1:§_-9ai§) : void
      {
         this.§_-3zu§ = param1.data.getBoolean(§_-22u§.ACTIVE);
         var _loc2_:§_-4zT§ = param1.data.§_-2jV§(§_-22u§.§_-7jn§,§_-4zT§);
         new §_-Br7§(_loc2_).showModal();
      }
      
      public function get isActive() : Boolean
      {
         return this.§_-3zu§;
      }
   }
}

