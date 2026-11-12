package §_-7ZD§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-0rs§.§_-6mU§;
   import §_-0yZ§.§_-3B0§;
   import §_-0yZ§.§_-aD§;
   import §_-2Uc§.§_-0dS§;
   import §_-2Uc§.§_-6Vy§;
   import §_-2Uc§.§_-9WF§;
   import §_-2qd§.§_-9ai§;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-40e§.§_-1m0§;
   import §_-52p§.§_-25R§;
   import §_-9VF§.§_-5ab§;
   import §_-AFi§.§_-3eb§;
   import §_-B6f§.§_-7wF§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bwh§.§_-AMW§;
   import §_-C6z§.§_-6JZ§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-1mX§ extends §_-6v4§
   {
      private var §_-UF§:Function = null;
      
      public function §_-1mX§()
      {
         super();
         §_-1-t§(§_-AA2§.§_-5Te§,this.§_-1U7§);
         §_-1-t§(§_-AA2§.RESTORE_ENERGY,this.onRestoreEnergy);
         §_-1-t§(§_-AA2§.§_-7dO§,this.§_-6qe§);
         §_-1-t§(§_-AA2§.§_-5jq§,this.§_-6Le§);
         §_-1-t§(§_-AA2§.§_-28e§,this.§_-4kM§);
         §_-1-t§(§_-AA2§.§_-0aH§,this.§_-7EK§);
         §_-1-t§(§_-AA2§.§_-Sl§,this.§_-4JO§);
      }
      
      public function §_-A6k§(param1:Function = null) : void
      {
         this.§_-UF§ = param1;
         §_-6gl§.sendExtMessage(§_-AA2§.RESTORE_ENERGY);
      }
      
      public function §_-5sx§(param1:int, param2:String = null) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-25R§.§_-1sg§,param1);
         _loc3_.put(§_-4OL§.§_-zp§,param2);
         §_-6gl§.sendExtMessage(§_-AA2§.BUY_SILVER,_loc3_);
      }
      
      public function §_-7mp§(param1:String, param2:int, param3:§_-aD§) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.putString(§_-4OL§.§_-zp§,param1);
         _loc4_.§_-CZf§(§_-4OL§.§_-1ar§,param2);
         _loc4_.§_-6JD§(§_-4OL§.§_-9hz§,param3);
         §_-6gl§.sendExtMessage(§_-AA2§.§_-0aH§,_loc4_);
      }
      
      public function §_-0XN§() : void
      {
         §_-6gl§.sendExtMessage(§_-AA2§.§_-Sl§);
      }
      
      private function §_-7EK§(param1:§_-9ai§) : void
      {
         var _loc2_:Boolean = param1.data.getBoolean(§_-3mj§.§_-2yH§,false);
         var _loc3_:String = param1.data.getString(§_-4OL§.§_-zp§,null);
         var _loc4_:int = param1.data.getInt(§_-4OL§.§_-0nb§,0);
         §_-AMW§.§_-8Ed§(_loc2_,_loc3_,_loc4_);
      }
      
      private function §_-1U7§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-4OL§.§_-zp§);
         var _loc3_:int = param1.data.getInt(§_-4OL§.§_-1ar§);
         var _loc4_:§_-7wF§ = Context.§_-2hc§.§_-5Yn§(_loc2_);
         if(_loc4_ == null)
         {
            return;
         }
         if(this.§_-8by§(_loc4_,_loc3_))
         {
            return;
         }
         new §_-9WF§(_loc4_,_loc3_).showModal();
         if(_loc4_.§_-BK2§)
         {
            Context.§_-2hc§.§_-AIb§(_loc2_);
         }
      }
      
      private function §_-8by§(param1:§_-7wF§, param2:int) : Boolean
      {
         var _loc3_:§_-6G§ = null;
         var _loc4_:§_-6mU§ = null;
         var _loc5_:§_-6JZ§ = null;
         for each(_loc3_ in §_-0nG§.instance.§_-2bV§())
         {
            if(_loc3_.isActive())
            {
               if(_loc3_ is §_-3eb§ && (_loc3_ as §_-3eb§).§_-8k3§(param1))
               {
                  (_loc3_ as §_-3eb§).§_-48v§(param1,param2);
                  return true;
               }
               if(_loc3_ is §_-6mU§)
               {
                  _loc4_ = _loc3_ as §_-6mU§;
                  _loc5_ = _loc4_.getComponent(§_-6JZ§) as §_-6JZ§;
                  if(_loc5_ != null && _loc5_.§_-8k3§(param1))
                  {
                     _loc5_.§_-48v§(param1,param2);
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      private function §_-6qe§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt(§_-4OL§.§_-1EO§);
         if(_loc2_ > 0)
         {
            new §_-0dS§(_loc2_).showModal();
         }
      }
      
      private function §_-6Le§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt(§_-4OL§.§_-5A6§);
         new §_-6Vy§(_loc2_).showModal();
      }
      
      private function onRestoreEnergy(param1:§_-9ai§) : void
      {
         var _loc2_:Function = null;
         Context.player.resources.fromAGSObject(param1.data.§_-ANw§(§_-5ab§.§_-0T5§));
         if(this.§_-UF§ is Function)
         {
            _loc2_ = this.§_-UF§;
            this.§_-UF§ = null;
            _loc2_();
         }
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§));
      }
      
      private function §_-4kM§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.§_-Bc6§(§_-4OL§.SALE_OFFERS,§_-3B0§);
         if(_loc2_ != null)
         {
            Context.§_-2hc§.offers = _loc2_;
         }
         var _loc3_:§_-3B0§ = param1.data.§_-2jV§(§_-4OL§.§_-28e§,§_-3B0§);
         if(_loc3_ == null)
         {
            return;
         }
         Context.§_-2hc§.§_-8ip§();
      }
      
      private function §_-4JO§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = [];
         if(param1.data.getBoolean(§_-3mj§.§_-2yH§,false))
         {
            _loc2_ = param1.data.§_-Bc6§(§_-4OL§.§_-0hC§,String);
         }
         Context.§_-06H§.§_-74§(Context.player.id,null,_loc2_ == null ? [] : _loc2_);
      }
   }
}

