package junkDNA

import (
)

// validates a directory being tested for by checking directory is not empty or corrupt
func validateDir(src, want, tmp, file string) error {
	dir, err := os.Stat(src)
	if err != nil {
		return fmt.Errorf("could not obtain stat; dir doesn't exist: %v", err)
	}
	if os.IsNotExist(err) {
		return fmt.Errorf("wrong OCI output format; got: %v, missing: %s", err, dir)
	}
	if !dir.IsDir() {
		return fmt.Errorf("failed to write directory to %s", tmp)
	}
	f, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("failed to open directory: %v", err)
	}
	defer f.Close()
	_, err = f.Readdirnames(1)
	if err == io.EOF {
		return fmt.Errorf("directory %s is empty: %v", src, err)
	}
	if err = compareSHA(file, want); err != nil {
		return fmt.Errorf("sha256 hex code did not match: %v", err)
	}

	return nil
}

