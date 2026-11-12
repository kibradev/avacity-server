package §_-AKx§
{
   import §_-1Fx§.§_-1IT§;
   import §_-1Fx§.§_-5n7§;
   import §_-6JL§.§_-B9P§;
   import §_-GM§.Context;
   import penzville.Config;
   
   public class §_-6Vi§ extends §_-5n7§
   {
      private var §_-7rN§:§_-1IT§ = null;
      
      private var §_-7so§:uint = 0;
      
      private var §_-4H2§:Number = 0.35;
      
      public function §_-6Vi§()
      {
         super();
         this.§_-3KH§();
      }
      
      private function §_-3KH§() : void
      {
         this.§_-7rN§ = new §_-1IT§();
         this.§_-5Dn§(this.§_-7so§,this.§_-4H2§);
         addChild(this.§_-7rN§);
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.§_-2nr§);
      }
      
      private function §_-5Dn§(param1:uint, param2:Number) : void
      {
         this.§_-7rN§.graphics.clear();
         this.§_-7rN§.graphics.lineStyle(0,0,0);
         this.§_-7rN§.graphics.beginFill(param1,param2);
         this.§_-7rN§.graphics.drawRect(0,0,Config.§_-50z§,Config.§_-6Z0§);
         this.§_-7rN§.graphics.endFill();
      }
      
      public function §_-2Or§(param1:uint, param2:Number) : void
      {
         if(this.§_-7rN§ != null)
         {
            this.§_-7so§ = param1;
            this.§_-4H2§ = param2;
            this.§_-5Dn§(this.§_-7so§,this.§_-4H2§);
         }
      }
      
      private function §_-2nr§(param1:§_-B9P§) : void
      {
         if(this.§_-7rN§ == null)
         {
            this.§_-3KH§();
            return;
         }
         this.§_-5Dn§(this.§_-7so§,this.§_-4H2§);
      }
   }
}

