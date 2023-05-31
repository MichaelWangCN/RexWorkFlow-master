using IdentityModel.Client;
using JadeFramework.Cache;
using Microsoft.Extensions.Options;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Infrastructure
{
    /// <summary>
    /// TokenClientOptions
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:33:19
    /// </remarks>
    public class TokenClientOptions
    {
        public string Address { get; set; }
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string GrantType { get; set; }
    }
    public class TokenClient
    {
        private ICachingProvider _cacheFactory;
        public TokenClient(HttpClient client, IOptions<TokenClientOptions> options, ICachingProvider cachingProvider)
        {
            Client = client;
            Options = options.Value;
            _cacheFactory = cachingProvider;
        }

        public HttpClient Client { get; }
        public TokenClientOptions Options { get; }

        public async Task<string> GetToken()
        {
            string res = _cacheFactory.Get("accessToken") as string;
            if (string.IsNullOrEmpty(res))
            {
                var response = await Client.RequestTokenAsync(new TokenRequest
                {
                    Address = Options.Address,
                    ClientId = Options.ClientId,
                    ClientSecret = Options.ClientSecret,
                    GrantType = Options.GrantType
                });
                if (response.AccessToken != null)
                {
                    _cacheFactory.Set("accessToken", response.AccessToken, new TimeSpan(0, 100, 0));
                    return response.AccessToken;
                }
                else
                {
                    return response.Error;
                }
            }
            else
            {
                return res;
            }
        }
    }
}
