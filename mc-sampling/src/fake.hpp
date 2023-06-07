#ifndef FAKE_INCLUDED
#define FAKE_INCLUDED

#include "metropolis.hpp"

namespace mc {
class fake : public metropolis {
public:
    fake(int npart, double side, int power, double gam);
    
    // delete copy constructor and assignment operator
    fake(const fake& x) = delete;
    fake& operator=(const fake& x) = delete;

    ~fake() override;

    void init_config() override;

protected:
    double potential_one(int k) const override;
    double potential_full() const override;

private:
    int p; // fake-LJ exponent
    double g;
};
} // namespace mc

#endif
