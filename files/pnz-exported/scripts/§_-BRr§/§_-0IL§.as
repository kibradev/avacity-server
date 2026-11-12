package §_-BRr§
{
   public class §_-0IL§ extends Button
   {
      public var idx:uint = 0;
      
      private var w:uint = 0;
      
      private var h:uint = 25;
      
      public function §_-0IL§(param1:String, param2:int, param3:int, param4:uint = 1)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function set width(param1:Number) : void
      {
         this.w = param1;
         this.updateButton();
      }
      
      override public function set height(param1:Number) : void
      {
         this.h = param1;
         this.updateButton();
      }
      
      override internal function updateButton() : void
      {
         switch(bt)
         {
            case §_-7Lg§:
               upState = new §_-8Gh§(0,s,this.w,this.h);
               overState = new §_-8Gh§(1,s,this.w,this.h);
               downState = new §_-8Gh§(2,s,this.w,this.h);
               break;
            default:
               upState = new §_-1sJ§(0,s,this.w,this.h);
               overState = new §_-1sJ§(1,s,this.w,this.h);
               downState = new §_-1sJ§(2,s,this.w,this.h);
         }
         hitTestState = overState;
      }
   }
}

