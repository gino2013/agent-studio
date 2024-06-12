package io.github.samzhu.studio;

import org.springframework.boot.SpringApplication;

public class TestAgentStudioApplication {

	public static void main(String[] args) {
		SpringApplication.from(AgentStudioApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
