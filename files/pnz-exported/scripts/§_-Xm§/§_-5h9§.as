package §_-Xm§
{
   import flash.events.ProgressEvent;
   
   public class §_-5h9§ extends ProgressEvent
   {
      public static const PROGRESS:String = "progress";
      
      public static const COMPLETE:String = "complete";
      
      private var §_-9xS§:Number;
      
      private var §_-Bw4§:Number;
      
      private var §_-84W§:Number;
      
      public var §_-BBI§:int;
      
      public var §_-9J2§:int;
      
      public var §_-4qP§:int;
      
      public function §_-5h9§(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function §_-AR9§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Number) : void
      {
         this.bytesLoaded = param1;
         this.bytesTotal = param2;
         this.§_-BBI§ = param3;
         this.§_-9J2§ = param4;
         this.§_-4qP§ = param5;
         this.§_-84W§ = param6;
         this.§_-Bw4§ = param2 > 0 ? param1 / param2 : 0;
         this.§_-9xS§ = param5 == 0 ? 0 : param4 / param5;
      }
      
      public function get §_-97§() : Number
      {
         return this.§_-84W§;
      }
   }
}

