def mux(m, s):
    assert 0 <= m < 256 and 0 <= s < 8
    return (m >> s) & 1

def demux(d, s):
    assert d in (0,1) and 0 <= s < 8
    return d << s

def run():
    for m in range(256):
        for s in range(8):
            assert mux(m,s)==((m>>s)&1)
            assert demux(0,s)==0
            assert demux(1,s)==(1<<s)

    # Shared-select behavioral invariants.
    for s in range(8):
        assert mux(0xFF,s)==1
        assert mux(0,s)==0
        assert demux(1,s)==(1<<s)

    print("B08 independent Python model: PASS")

if __name__=="__main__":
    run()
