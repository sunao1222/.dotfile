{ inputs, ... }:
{
  imports = [
    inputs.agent-skills.homeManagerModules.default
  ];

  programs.agent-skills = {
    enable = true;
    targets.agents = {
      enable = true;
      flatten = true;
    };
    sources.i-have-adhd = {
      input = "i-have-adhd";
      subdir = "skills";
    };
    sources.laravel = {
      input = "laravel";
      subdir = "laravel/skills";
      idPrefix = "laravel";
    };
    sources.my-skills = {
      input = "my-skills";
      subdir = "skills";
      idPrefix = "my-skills";
    };
    sources.agent-toolkit = {
      input = "agent-toolkit";
      subdir = "skills";
      idPrefix = "agent-toolkit";
    };
    sources.anthropic = {
      input = "anthropic-skills";
      subdir = "skills";
      idPrefix = "anthropic";
    };
    sources.awesome-copilot = {
      input = "awesome-copilot";
      subdir = "skills";
      idPrefix = "awesome-copilot";
    };
    skills.enable = [
      "my-skills/nix-development"
      "laravel/starter-kit-upgrade"
      "agent-toolkit/marp-slide"
      "agent-toolkit/mermaid-diagrams"
      "anthropic/frontend-design"
      "anthropic/pdf"
      "anthropic/pptx"
      "anthropic/skill-creator"
      "anthropic/theme-factory"
      "anthropic/webapp-testing"
      "awesome-copilot/gh-attach"
      "awesome-copilot/git-commit"
      "awesome-copilot/git-flow-branch-creator"
      "awesome-copilot/refactor"
      "awesome-copilot/review-and-refactor"
      "awesome-copilot/security-review"
    ];
  };
}
