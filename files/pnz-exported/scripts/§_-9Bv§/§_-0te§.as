package §_-9Bv§
{
   import §_-6-L§.§_-3hw§;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-6QE§.§_-6LW§;
   
   public class §_-0te§
   {
      public static const §_-4OK§:String = "replace";
      
      public static const §_-6Mp§:String = "add";
      
      private var _mode:String;
      
      private var _template:Object;
      
      private var §_-3rI§:String;
      
      public function §_-0te§(param1:XML)
      {
         super();
         this._mode = §_-3hw§.getString(param1,"@mode",§_-4OK§);
         this.§_-3rI§ = §_-3hw§.getString(param1,"@path",null);
         var _loc2_:§_-2Ho§ = §_-2Ho§.§_-B2Z§(param1,null,true);
         this._template = _loc2_.toObject();
      }
      
      public function apply(param1:§_-8fL§) : void
      {
         switch(this._mode)
         {
            case §_-4OK§:
               this.§_-5KC§(param1);
               break;
            case §_-6Mp§:
               this.§_-2PC§(param1);
               break;
            default:
               throw new §_-6LW§("Unknown appconfig patch mode \"" + this._mode + "\"");
         }
      }
      
      private function §_-5KC§(param1:§_-8fL§) : void
      {
         var _loc2_:Object = param1.template;
         if(this.§_-3rI§ != null)
         {
            _loc2_ = param1.§_-2Bq§(this.§_-3rI§,true);
         }
         §_-6aF§.merge(this._template,_loc2_);
      }
      
      private function §_-2PC§(param1:§_-8fL§) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:Object = param1.template;
         if(this.§_-3rI§ != null)
         {
            _loc2_ = param1.§_-2Bq§(this.§_-3rI§,true);
         }
         for(_loc3_ in this._template)
         {
            if(!_loc2_.hasOwnProperty(_loc3_))
            {
               _loc2_[_loc3_] = [];
            }
            if(!(_loc2_[_loc3_] is Array))
            {
               _loc2_[_loc3_] = [_loc2_[_loc3_]];
            }
            if(!(this._template[_loc3_] is Array))
            {
               this._template[_loc3_] = [this._template[_loc3_]];
            }
            _loc4_ = _loc2_[_loc3_];
            §_-49j§.merge(_loc4_,this._template[_loc3_]);
         }
      }
   }
}

