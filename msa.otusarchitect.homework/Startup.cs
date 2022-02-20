using Hellang.Middleware.ProblemDetails;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Prometheus;

namespace msa.otusarchitect.homework
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer("name=ConnectionStrings:AppDatabase");
            });
            services.AddHealthChecks()
                .ForwardToPrometheus();
            services.AddSwaggerGen();

            services.AddProblemDetails();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseRouting();
            app.UseHttpMetrics(options =>
            {
                options.CaptureMetricsUrl = false;
            });

            app.UseProblemDetails();

            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapMetrics();
                endpoints.MapHealthChecks("/health", new HealthCheckOptions
                {
                    ResponseWriter = new HealthChecks.HealthCheckResultWriter().Write
                });
                endpoints.MapControllers();
            });
        }
    }
}
