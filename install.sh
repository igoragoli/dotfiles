#!/bin/bash

if command -v claude &> /dev/null; then
    claude plugins install notify@claude-code-notify
    claude plugins install feature-workflow@drew-csillag-marketplace
    claude plugins install gopls-lsp@claude-plugins-official
    claude plugins install ralph-loop@claude-plugins-official
fi
