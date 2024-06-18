function kubectl --wraps kubectl
    set -x KUBECOLOR_FORCE_COLORS true
	kubecolor $argv
end
