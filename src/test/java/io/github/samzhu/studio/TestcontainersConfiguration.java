package io.github.samzhu.studio;

import java.io.IOException;

import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.ollama.OllamaContainer;
import org.testcontainers.utility.DockerImageName;

@TestConfiguration(proxyBeanMethods = false)
class TestcontainersConfiguration {

	@Bean
	@ServiceConnection
	PostgreSQLContainer<?> pgvectorContainer() {
		return new PostgreSQLContainer<>(DockerImageName.parse("pgvector/pgvector:pg16"));
	}

	@Bean
	// @ServiceConnection
	OllamaContainer ollama() throws UnsupportedOperationException, IOException, InterruptedException {
		OllamaContainer ollama = new OllamaContainer("ollama/ollama:0.1.43");
		// ollama.addExposedPort(11434);
		// ollama.execInContainer("ollama", "pull", "llama3");
		// ollama.execInContainer("ollama", "pull", "nomic-embed-text");
		return ollama;
	}

	// @Bean
	// @ServiceConnection
	// PostgreSQLContainer<?> postgresContainer() {
	// return new PostgreSQLContainer<>(DockerImageName.parse("postgres:latest"));
	// }

}
