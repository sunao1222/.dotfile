{ inputs, ... }:
{
  imports = [
    inputs.agent-skills.homeManagerModules.default
  ];

  programs.agent-skills = {
    enable = true;
    targets.opencode.enable = true;
    targets.pi.enable = true;
    targets.oh-my-pi.enable = true;
    sources.i-have-adhd = {
      input = "i-have-adhd";
      subdir = "skills";
    };
    sources.my-skills = {
      input = "my-skills";
      subdir = "skills";
      idPrefix = "my-skills";
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
      "anthropic/frontend-design"
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
