<a href="https://idx.google.com/import?url=https%3A%2F%2Fgithub.com%2Fsamzhu%2Fagent-studio">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <img height="32" alt="Open in IDX" src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>

# Agent-Studio

Agent-Studio is an advanced open-source LLM app development platform designed to orchestrate and manage LLM applications, from intelligent agents to complex AI workflows. It offers seamless integration of external knowledge, creative document generation, and low-code tools for building customized agents. The platform integrates with enterprise systems, flexibly orchestrates AI processes, creates autonomous AI agents, and connects to global LLMs to meet evolving business needs.  

[Download project](https://start.spring.io/#!type=gradle-project&language=java&platformVersion=3.3.0&packaging=jar&jvmVersion=21&groupId=io.github.samzhu&artifactId=agent-studio&name=agent-studio&description=Agent-Studio%20is%20an%20open-source%20LLM%20app%20development%20platform%2C%20ideal%20for%20production%2C%20supporting%20knowledge%20integration%2C%20document%20generation%2C%20and%20low-code%20agent%20building%2C%20connecting%20to%20enterprise%20systems%20and%20global%20LLMs.&packageName=io.github.samzhu.studio&dependencies=devtools,lombok,configuration-processor,docker-compose,modulith,web,thymeleaf,oauth2-resource-server,data-jpa,liquibase,postgresql,data-jdbc,validation,cache,actuator,sbom-cyclone-dx,prometheus,distributed-tracing,testcontainers,spring-ai-azure-openai,spring-ai-ollama,spring-ai-openai,spring-ai-vectordb-pgvector,cloud-resilience4j,data-rest)

## Features



## Test

```shell
docker compose up
```

Once docker compose has started, run the following command to test:

```shell
curl --location 'http://localhost:11434/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
    "model": "llama3",
    "stream": true,
    "messages": [
        {
            "role": "user",
            "content": "你好"
        }
    ]
}'
```

Output:

``` json
{
    "id": "chatcmpl-246",
    "object": "chat.completion.chunk",
    "created": 1718164515,
    "model": "llama3",
    "system_fingerprint": "fp_ollama",
    "choices": [
        {
            "index": 0,
            "delta": {
                "role": "assistant",
                "content": "提出"
            },
            "finish_reason": null
        }
    ]
}
```

``` json
{
    "id": "chatcmpl-246",
    "object": "chat.completion.chunk",
    "created": 1718164523,
    "model": "llama3",
    "system_fingerprint": "fp_ollama",
    "choices": [
        {
            "index": 0,
            "delta": {
                "role": "assistant",
                "content": ""
            },
            "finish_reason": "stop"
        }
    ]
}
```

In the end, it will still return a

``` text
[DONE]
```

## Manual Configuration


## References

- [Ollama embedding models](https://ollama.com/blog/embedding-models)
- [valiantlynx docker-compose-ollama-gpu.yaml](https://github.com/valiantlynx/ollama-docker/blob/main/docker-compose-ollama-gpu.yaml)
- [stackoverflow how to pull model automatically with container creation?](https://stackoverflow.com/questions/78500319/how-to-pull-model-automatically-with-container-creation)
- [Testcontainers module for Ollama](https://java.testcontainers.org/modules/ollama/)
- [habuma/spring-ai-examples](https://github.com/habuma/spring-ai-examples/tree/main)
- [ThomasVitale/llm-apps-java-spring-ai](https://github.com/ThomasVitale/llm-apps-java-spring-ai/tree/main)
- [Full-stack development in Project IDX](https://idx.dev/blog/article/full-stack-development-in-project-idx)
- [Spring Boot Application Testing and Development with Testcontainers](https://www.docker.com/blog/spring-boot-application-testing-and-development-with-testcontainers/)
- [testcontainers/java-local-development-workshop](https://github.com/testcontainers/java-local-development-workshop)





