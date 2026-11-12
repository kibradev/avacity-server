package §_-5RV§
{
   import §_-2qd§.§_-9tB§;
   import §_-6-L§.§_-CZQ§;
   import §_-AZ4§.§_-Any§;
   import §_-BeZ§.§_-1e5§;
   import ags.§_-5x-§;
   
   public class §_-9CT§ extends §_-9mD§
   {
      public static const ID:int = §_-8pr§.§_-7oY§;
      
      private var _userId:String;
      
      private var §_-6hJ§:Boolean;
      
      private var §_-98d§:Boolean;
      
      private var §_-130§:Boolean;
      
      private var §_-5l3§:String;
      
      public function §_-9CT§()
      {
         super(ID);
      }
      
      override public function execute(param1:§_-5x-§) : void
      {
         param1.§_-5fL§ = §_-Any§.§_-CJ2§;
         param1.userId = this._userId;
         param1.configure(this.§_-98d§,this.§_-130§,this.§_-6hJ§,§_-CZQ§.§_-5qk§(this.§_-5l3§));
         param1.dispatchEvent(new §_-9tB§(§_-9tB§.§_-7Lr§));
      }
      
      override public function readArray(param1:§_-1e5§) : void
      {
         §_-aS§(param1,5);
         this._userId = param1.getString(0);
         this.§_-5l3§ = param1.getString(1);
         this.§_-6hJ§ = param1.getBoolean(2);
         this.§_-98d§ = param1.getBoolean(3);
         this.§_-130§ = param1.getBoolean(4);
      }
   }
}

