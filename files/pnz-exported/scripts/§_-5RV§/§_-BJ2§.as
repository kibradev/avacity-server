package §_-5RV§
{
   import §_-2qd§.§_-C-z§;
   import §_-BeZ§.§_-1e5§;
   import ags.§_-5x-§;
   
   public class §_-BJ2§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-26M§;
      
      private var §_-66m§:String;
      
      private var _userId:String;
      
      public function §_-BJ2§()
      {
         super(ID);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         param1.dispatchEvent(new §_-C-z§(§_-C-z§.§_-26M§,this.§_-66m§,this._userId));
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         §_-aS§(param1,2);
         this.§_-66m§ = param1.getString(0);
         this._userId = param1.getString(1);
      }
   }
}

