package §_-kr§
{
   public class §_-8He§
   {
      public var cdn:String = null;
      
      public var contentUrl:String = null;
      
      public var contentMirrorUrl:String = null;
      
      public var furnitureUrl:String = null;
      
      public var furnitureMirrorUrl:String = null;
      
      private var §_-1eJ§:String = null;
      
      private var §_-h3§:String = null;
      
      private var §_-1-X§:Boolean = false;
      
      public function §_-8He§()
      {
         super();
      }
      
      public function get §_-5Ni§() : String
      {
         return this.§_-1eJ§ == null ? this.contentUrl : this.§_-1eJ§;
      }
      
      public function set §_-5Ni§(param1:String) : void
      {
         this.§_-1eJ§ = param1;
      }
      
      public function get §_-1uo§() : String
      {
         return this.§_-h3§ == null ? this.contentMirrorUrl : this.§_-h3§;
      }
      
      public function set §_-1uo§(param1:String) : void
      {
         this.§_-h3§ = param1;
      }
      
      public function get ignoreVersions() : Boolean
      {
         return this.§_-1-X§;
      }
      
      public function set ignoreVersions(param1:Boolean) : void
      {
         this.§_-1-X§ = param1;
      }
   }
}

