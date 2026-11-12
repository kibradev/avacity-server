package §_-4Ms§
{
   import §_-1Fx§.§_-5n7§;
   import flash.display.DisplayObject;
   
   public class §_-mm§ extends §_-5n7§
   {
      private var §_-1WA§:Hint = null;
      
      public function §_-mm§()
      {
         super();
         visible = false;
      }
      
      public function hide(param1:DisplayObject = null) : void
      {
         visible = false;
      }
      
      public function show(param1:DisplayObject = null) : void
      {
         visible = true;
      }
      
      public function get hint() : Hint
      {
         return this.§_-1WA§;
      }
      
      public function set hint(param1:Hint) : void
      {
         this.§_-1WA§ = param1;
      }
      
      public function updateDescription(param1:String = null) : void
      {
      }
      
      override public function destroy() : void
      {
         removeAllChildren(true,true);
         this.§_-1WA§ = null;
         super.destroy();
      }
   }
}

