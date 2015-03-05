#ifndef D_SOM_VECTOR_H
#define D_SOM_VECTOR_H

namespace Som {

template <typename BasisType>
class Vector {
public:
    Vector( const BasisType& basis )
        : basis_( basis ) {}

    BasisType get() const {
        return basis_;
    }

    Vector operator+( const Vector& value ) const {
        return basis_ + value.get();
    }

    Vector operator-( const Vector& value ) const {
        return basis_ - value.get();
    }

    template <typename ScalarType>
    Vector operator*( const ScalarType& value ) const {
        return basis_ * value;
    }

    template <typename ScalarType>
    Vector operator/( const ScalarType& value ) const {
        return basis_ / value;
    }

    /* コピー・ムーブはpublic default属性 */
    Vector(Vector const&) = default;
    Vector(Vector&&) = default;
    Vector& operator =(Vector const&) = default;
    Vector& operator =(Vector&&) = default;

    ~Vector() = default;

private:
    BasisType basis_;
};

template <typename BasisType>
BasisType abs( const Vector<BasisType>& value )
{
    return abs( value.get() );
}

}

#endif
