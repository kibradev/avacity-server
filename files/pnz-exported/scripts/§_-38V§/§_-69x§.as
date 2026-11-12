package §_-38V§
{
   import §_-6-L§.§_-7uH§;
   
   public class §_-69x§
   {
      public var start:int;
      
      public var length:int;
      
      public var loop:Boolean;
      
      public var name:String;
      
      public function §_-69x§(param1:int = 1, param2:int = 0, param3:Boolean = false, param4:String = null)
      {
         super();
         this.start = param1;
         this.length = param2;
         this.loop = param3;
         this.name = param4;
      }
      
      public function §_-1f0§(param1:XML) : void
      {
         if(param1.hasOwnProperty("@start"))
         {
            this.start = parseInt(param1["@start"]);
         }
         if(param1.hasOwnProperty("@length"))
         {
            this.length = parseInt(param1["@length"]);
         }
         if(param1.hasOwnProperty("@loop"))
         {
            this.loop = §_-7uH§.§_-5i§(param1["@loop"]);
         }
         if(param1.hasOwnProperty("@name"))
         {
            this.name = param1["@name"];
         }
      }
      
      public function toString() : String
      {
         return "start: " + this.start + "; length" + this.length + "; loop: " + this.loop + "; name: " + this.name;
      }
   }
}

