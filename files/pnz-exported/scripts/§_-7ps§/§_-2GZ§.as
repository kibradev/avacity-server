package §_-7ps§
{
   public class §_-2GZ§
   {
      private var §_-7kL§:Array = [];
      
      private var §_-C6t§:Object = {};
      
      public function §_-2GZ§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var stepId:String;
         var stepXml:XML;
         var indexes:Object = null;
         var step:§_-5aL§ = null;
         var xml:XML = param1;
         if(xml == null)
         {
            return;
         }
         stepId = null;
         stepXml = null;
         indexes = {};
         for each(stepXml in (xml.elements("flow")[0] as XML).elements("step"))
         {
            stepId = stepXml["@id"];
            indexes[stepId] = stepXml["@index"];
            this.§_-7kL§.push(stepId);
         }
         this.§_-7kL§.sort(function(param1:String, param2:String):Number
         {
            return indexes[param1] - indexes[param2];
         });
         step = null;
         for each(stepXml in (xml.elements("steps")[0] as XML).elements("step"))
         {
            stepId = stepXml["@id"];
            step = new §_-5aL§();
            step.configure(stepXml);
            this.§_-C6t§[stepId] = step;
         }
      }
      
      public function getStep(param1:String) : §_-5aL§
      {
         if(this.§_-C6t§.hasOwnProperty(param1))
         {
            return this.§_-C6t§[param1];
         }
         return null;
      }
      
      public function §_-AO5§(param1:String) : §_-5aL§
      {
         var _loc2_:§_-5aL§ = null;
         for each(_loc2_ in this.§_-C6t§)
         {
            if(_loc2_.questId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get §_-4RY§() : Array
      {
         return this.§_-7kL§;
      }
   }
}

