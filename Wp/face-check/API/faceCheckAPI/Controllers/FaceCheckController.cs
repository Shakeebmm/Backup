using faceCheckAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace faceCheckAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FaceCheckController : ApiController
    {
        // GET: api/FaceCheck
        public IEnumerable<string> Get()
        {
            return new string[] { "value1..", "value2.." };
        }

        // GET: api/FaceCheck/5
        public string Get(int id)
        {
            return "value";
        }

        [HttpPost]
        public void indexFace([FromBody]string value)
        {
            FaceInput ip = JsonConvert.DeserializeObject<FaceInput>(getRawPostData().Result);

        }

        private async Task<String> getRawPostData()
        {
            using (var contentStream = await this.Request.Content.ReadAsStreamAsync())
            {
                contentStream.Seek(0, SeekOrigin.Begin);
                using (var sr = new StreamReader(contentStream))
                {
                    return sr.ReadToEnd();
                }
            }
        }

        // PUT: api/FaceCheck/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/FaceCheck/5
        public void Delete(int id)
        {
        }
    }
}
