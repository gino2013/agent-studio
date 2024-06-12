package io.github.samzhu.studio;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.ai.embedding.EmbeddingResponse;
import org.springframework.ai.ollama.OllamaEmbeddingModel;
import org.springframework.ai.ollama.api.OllamaApi;
import org.springframework.ai.ollama.api.OllamaOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.ollama.OllamaContainer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ActiveProfiles("ut")
@AutoConfigureWebTestClient(timeout = "60s")
@Import(TestcontainersConfiguration.class)
@Testcontainers(disabledWithoutDocker = true)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class AgentStudioApplicationTests {

	@Autowired
	private OllamaContainer ollamaContainer;

	private static final String MODEL_NAME = "nomic-embed-text";
	private static final List<String> INPUT_TEXTS = List.of("Hello World", "World is big and salvation is near");
	private static final int EXPECTED_SIZE = 2;

	@Test
	@DisplayName("Embedding response returns correct size")
	void testEmbeddingResponse() throws UnsupportedOperationException, IOException, InterruptedException {
		// Pull the model inside the container
		ollamaContainer.execInContainer("ollama", "pull", MODEL_NAME);

		// Initialize the API and model options
		OllamaApi ollamaApi = new OllamaApi(ollamaContainer.getEndpoint());
		OllamaOptions ollamaOptions = OllamaOptions.create().withModel(MODEL_NAME);

		// Create the embedding model and get the response
		OllamaEmbeddingModel embeddingModel = new OllamaEmbeddingModel(ollamaApi, ollamaOptions);
		EmbeddingResponse embeddingResponse = embeddingModel.embedForResponse(INPUT_TEXTS);

		// Assert the response
		assertNotNull(embeddingResponse, "The embedding response should not be null");
		assertEquals(EXPECTED_SIZE, embeddingResponse.getResults().size(),
				String.format("The embedding response should have %d results", EXPECTED_SIZE));
	}

}
