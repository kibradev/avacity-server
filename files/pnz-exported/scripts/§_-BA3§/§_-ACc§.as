package §_-BA3§
{
   import §_-BeZ§.§_-1AH§;
   
   public class §_-ACc§
   {
      private var §_-6Tb§:Class;
      
      private var §_-BhA§:§_-1AH§;
      
      private var §_-6Uz§:Class;
      
      private var §_-0NI§:§_-1AH§;
      
      public function §_-ACc§(param1:Class = null, param2:§_-1AH§ = null, param3:Class = null, param4:§_-1AH§ = null)
      {
         super();
         this.§_-6Tb§ = param1;
         this.§_-BhA§ = param2;
         this.§_-6Uz§ = param3;
         this.§_-0NI§ = param4;
      }
      
      public static function create(param1:* = null, param2:* = null) : §_-ACc§
      {
         if(param1 != null)
         {
            if(param1 is Class)
            {
               return new §_-ACc§(param1,null);
            }
            if(param1 is §_-1AH§)
            {
               return new §_-ACc§(null,param1);
            }
            throw new Error("Invalid parameter classOrFactory=" + param1 + ", but Class or AGSInstanceFactory required");
         }
         if(param2 != null)
         {
            if(param2 is Class)
            {
               return new §_-ACc§(null,null,param2);
            }
            if(param2 is §_-1AH§)
            {
               return new §_-ACc§(null,null,null,param2);
            }
            throw new Error("Invalid parameter itemOrFactory=" + param1 + ", but Class or AGSInstanceFactory required");
         }
         return new §_-ACc§();
      }
      
      public function get instanceClass() : Class
      {
         return this.§_-6Tb§;
      }
      
      public function get instanceFactory() : §_-1AH§
      {
         return this.§_-BhA§;
      }
      
      public function get §_-6Hm§() : Class
      {
         return this.§_-6Uz§;
      }
      
      public function get itemFactory() : §_-1AH§
      {
         return this.§_-0NI§;
      }
      
      public function §_-9nY§() : Boolean
      {
         return this.§_-6Tb§ == null && this.§_-BhA§ == null;
      }
      
      public function §_-yi§() : Boolean
      {
         return this.§_-6Tb§ == null;
      }
      
      public function §_-0qu§() : Boolean
      {
         return this.§_-6Uz§ == null && this.§_-BhA§ == null;
      }
      
      public function §_-6SL§() : §_-ACc§
      {
         return new §_-ACc§(this.§_-6Uz§,this.§_-0NI§);
      }
      
      public function toString() : String
      {
         return "UnwrapOptions{_instanceClass=" + String(this.§_-6Tb§) + ",_instanceFactory=" + String(this.§_-BhA§) + "}, _itemClass=" + String(this.§_-6Uz§) + ", itemFactory=" + String(this.§_-0NI§);
      }
   }
}

