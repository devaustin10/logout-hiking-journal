package learn.hiking.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    private final JwtConverter converter;
    private final UserDetailsService userDetailsService;

    public SecurityConfig(JwtConverter converter, UserDetailsService userDetailsService) {
        this.converter = converter;
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, AuthenticationConfiguration authConfig) throws Exception {
        http.csrf().disable();

        http.cors();

        http.authorizeRequests()
                .antMatchers("/authenticate").permitAll()
                // new...
                .antMatchers("/create_account").permitAll()
                .antMatchers("/refresh_token").authenticated()
                .antMatchers(HttpMethod.GET,
                        "/hike", "/hike/*").permitAll()
                .antMatchers(HttpMethod.POST,
                        "/hike").hasAnyAuthority("USER", "ADMIN")
//                        "/hike").permitAll()
                .antMatchers(HttpMethod.PUT,
                        "/hike/*").hasAnyAuthority("USER", "ADMIN")
                .antMatchers(HttpMethod.DELETE,
                        "/hike/*").hasAnyAuthority("ADMIN")

                .antMatchers(HttpMethod.GET,
                        "/hiker", "/hiker/*").permitAll()
                .antMatchers(HttpMethod.POST,
//                        "/hiker").hasAnyAuthority("USER", "ADMIN")
                        "/hiker").permitAll()
                .antMatchers(HttpMethod.PUT,
                        "/hiker/*").hasAnyAuthority("ADMIN")
                .antMatchers(HttpMethod.DELETE,
                        "/hiker/*").hasAnyAuthority("ADMIN")

                .antMatchers(HttpMethod.GET,
                        "/trail", "/trail/*").permitAll()
                .antMatchers(HttpMethod.POST,
                        "/trail").hasAnyAuthority("ADMIN")
                .antMatchers(HttpMethod.PUT,
                        "/trail/*").hasAnyAuthority("ADMIN")
                .antMatchers(HttpMethod.DELETE,
                        "/trail/*").hasAnyAuthority("ADMIN")

                .antMatchers("/**").denyAll()
                .and()
                .addFilter(new JwtRequestFilter(authenticationManager(authConfig), converter))
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        return http.build();
    }


    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}
