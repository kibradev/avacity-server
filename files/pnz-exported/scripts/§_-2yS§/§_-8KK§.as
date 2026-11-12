package §_-2yS§
{
   import §_-23V§.§_-BaL§;
   import §_-23V§.§_-qo§;
   import §_-5g6§.§_-5PC§;
   import §_-5g6§.§_-6WB§;
   import §_-90R§.§_-aZ§;
   
   public class §_-8KK§ extends §_-5PC§ implements §_-6WB§
   {
      protected var §_-B33§:§_-BaL§;
      
      public function §_-8KK§(param1:String, param2:int = 1)
      {
         super(param1);
         _direction = §_-aZ§.N;
         this.§_-B33§ = new §_-BaL§(this,param2);
      }
      
      public function addAction(param1:§_-qo§, param2:int = -1, param3:int = 0) : void
      {
         if(param2 < 0)
         {
            param2 = world.inTick ? world.currentTick + 1 : world.currentTick;
         }
         param1.setActor(this);
         this.§_-B33§.addAction(param1,param2,0,param3);
      }
      
      public function getCurrentAction(param1:int = 0) : §_-qo§
      {
         return this.§_-B33§.getTrack(param1).currentAction;
      }
      
      protected function tickAction() : void
      {
         if(this.§_-B33§ != null)
         {
            this.§_-B33§.tick();
         }
      }
      
      public function getNextAction(param1:int = 0) : §_-qo§
      {
         if(this.§_-B33§ == null)
         {
            return null;
         }
         return this.§_-B33§.getTrack(0) != null ? this.§_-B33§.getTrack(0).nextAction : null;
      }
      
      public function cancelAll() : void
      {
         this.§_-B33§.clear();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-B33§ != null)
         {
            this.§_-B33§.destroy();
            this.§_-B33§ = null;
         }
         super.destroy();
      }
      
      override public function tick() : void
      {
         this.tickAction();
      }
      
      public function setAnimation(param1:String, param2:Object = null) : void
      {
      }
   }
}

