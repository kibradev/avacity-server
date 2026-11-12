package §_-2ZF§
{
   import §_-6-L§.§_-7uH§;
   
   public class §_-A2D§
   {
      private var _name:String;
      
      private var _type:int;
      
      private var _editable:Boolean = true;
      
      private var §_-AVS§:Array = [];
      
      public function §_-A2D§(param1:String, param2:int, param3:Boolean = true)
      {
         super();
         this._name = param1;
         this._type = param2;
         this._editable = param3;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._editable = param1;
      }
      
      public function §_-6QL§(param1:*) : String
      {
         if(param1 is Boolean)
         {
            return Boolean(param1) ? "true" : "false";
         }
         return param1;
      }
      
      public function §_-5I9§(param1:String) : *
      {
         switch(this._type)
         {
            case §_-7jv§.§_-4O1§:
               return §_-7uH§.§_-5i§(param1);
            case §_-7jv§.§_-CMS§:
               return parseInt(param1);
            case §_-7jv§.§_-Ta§:
               return parseFloat(param1);
            case §_-7jv§.§_-1B5§:
               return param1;
            default:
               return;
         }
      }
      
      public function clone() : §_-A2D§
      {
         return new §_-A2D§(this._name,this._type,this._editable);
      }
   }
}

