package §_-ApY§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-8rN§ implements §_-0Yu§
   {
      public static const §_-6Ud§:String = "id";
      
      public static const §_-CM-§:String = "stid";
      
      public static const §_-8fM§:String = "icnurl";
      
      public static const §_-4Z3§:String = "ttl";
      
      public static const §_-2-2§:String = "dsctn";
      
      public static const §_-5Hw§:String = "lnk";
      
      public static const §_-5VY§:String = "prt";
      
      public static const §_-8sS§:String = "act";
      
      private var §_-AcP§:int = 0;
      
      private var §_-7Av§:String;
      
      private var §_-9JS§:String;
      
      private var §_-Avc§:String;
      
      private var §_-24q§:String;
      
      private var _link:String;
      
      private var _priority:int;
      
      private var §_-3zu§:Boolean;
      
      public function §_-8rN§()
      {
         super();
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get §_-8u4§() : String
      {
         return this.§_-7Av§;
      }
      
      public function set §_-8u4§(param1:String) : void
      {
         this.§_-7Av§ = param1;
      }
      
      public function get §_-7aX§() : String
      {
         return this.§_-9JS§;
      }
      
      public function set §_-7aX§(param1:String) : void
      {
         this.§_-9JS§ = param1;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function set title(param1:String) : void
      {
         this.§_-Avc§ = param1;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function set description(param1:String) : void
      {
         this.§_-24q§ = param1;
      }
      
      public function get link() : String
      {
         return this._link;
      }
      
      public function set link(param1:String) : void
      {
         this._link = param1;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      public function get active() : Boolean
      {
         return this.§_-3zu§;
      }
      
      public function set active(param1:Boolean) : void
      {
         this.§_-3zu§ = param1;
      }
      
      public function §_-9kb§() : Boolean
      {
         return this._link != null && this._link != "";
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-CZf§(§_-6Ud§,this.id);
         param1.putString(§_-CM-§,this.§_-8u4§);
         param1.putString(§_-4Z3§,this.title);
         param1.putString(§_-8fM§,this.§_-7aX§);
         param1.putString(§_-2-2§,this.description);
         param1.putString(§_-5Hw§,this.link);
         param1.§_-CZf§(§_-5VY§,this.priority);
         param1.§_-6YJ§(§_-8sS§,this.active);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.id = param1.getInt(§_-6Ud§);
         this.§_-8u4§ = param1.getString(§_-CM-§);
         this.§_-7aX§ = param1.getString(§_-8fM§);
         this.title = param1.getString(§_-4Z3§);
         this.description = param1.getString(§_-2-2§);
         this.link = param1.getString(§_-5Hw§);
         this.priority = param1.getInt(§_-5VY§);
         this.active = param1.getBoolean(§_-8sS§);
      }
   }
}

