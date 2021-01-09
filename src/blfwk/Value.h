/*
 * Copyright (c) 2013-14, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#if !defined(_Value_h_)
#define _Value_h_

#include <string>
#include "blfwk/stdafx.h"
#include "blfwk/int_size.h"
#include "blfwk/Blob.h"

namespace blfwk
{
/*!
 * \brief Abstract base class for values of arbitrary types.
 */
class Value
{
public:
    Value() {}
    virtual ~Value() {}
    virtual std::string getTypeName() const = 0;
    virtual size_t getSize() const = 0;
};

/*!
 * \brief 32-bit signed integer value.
 */
class IntegerValue : public Value
{
public:
    IntegerValue()
        : m_value(0)
    {
    }
    IntegerValue(uint32_t value)
        : m_value(value)
    {
    }
    IntegerValue(const IntegerValue &other)
        : m_value(other.m_value)
    {
    }

    virtual std::string getTypeName() const { return "integer"; }
    virtual size_t getSize() const { return sizeof(m_value); }
    inline uint32_t getValue() const { return m_value; }
    inline operator uint32_t() const { return m_value; }
    inline IntegerValue &operator=(uint32_t value)
    {
        m_value = value;
        return *this;
    }

protected:
    uint32_t m_value; //!< The integer value.
};

/*!
 * \brief Adds a word size attribute to IntegerValue.
 *
 * The word size really only acts as an attribute that is carried along
 * with the integer value. It doesn't affect the actual value at all.
 * However, you can use the getWordSizeMask() method to mask off bits
 * that should not be there.
 *
 * The word size defaults to a 32-bit word.
 */
class SizedIntegerValue : public IntegerValue
{
public:
    SizedIntegerValue()
        : IntegerValue()
        , m_size(kWordSize)
    {
    }
    SizedIntegerValue(uint32_t value, int_size_t size = kWordSize)
        : IntegerValue(value)
        , m_size(size)
    {
    }
    SizedIntegerValue(uint16_t value)
        : IntegerValue(value)
        , m_size(kHalfWordSize)
    {
    }
    SizedIntegerValue(uint8_t value)
        : IntegerValue(value)
        , m_size(kByteSize)
    {
    }
    SizedIntegerValue(const SizedIntegerValue &other)
        : IntegerValue(other)
        , m_size(other.m_size)
    {
    }

    virtual std::string getTypeName() const { return "sized integer"; }
    virtual size_t getSize() const;

    inline int_size_t getWordSize() const { return m_size; }
    inline void setWordSize(int_size_t size) { m_size = size; }
    //! \brief Returns a 32-bit mask value dependant on the word size attribute.
    uint32_t getWordSizeMask() const;

    //! \name Assignment operators
    //! These operators set the word size as well as the integer value.
    //@{
    SizedIntegerValue &operator=(uint8_t value)
    {
        m_value = value;
        m_size = kByteSize;
        return *this;
    }
    SizedIntegerValue &operator=(uint16_t value)
    {
        m_value = value;
        m_size = kHalfWordSize;
        return *this;
    }
    SizedIntegerValue &operator=(uint32_t value)
    {
        m_value = value;
        m_size = kWordSize;
        return *this;
    }
    //@}

protected:
    int_size_t m_size; //!< Size of the integer.
};

/*!
 * \brief String value.
 *
 * Simply wraps the STL std::string class.
 */
class StringValue : public Value
{
public:
    StringValue()
        : m_value()
    {
    }
    StringValue(const std::string &value)
        : m_value(value)
    {
    }
    StringValue(const std::string *value)
        : m_value(*value)
    {
    }
    StringValue(const StringValue &other)
        : m_value(other.m_value)
    {
    }

    virtual std::string getTypeName() const { return "string"; }
    virtual size_t getSize() const { return m_value.size(); }
    operator const char *() const { return m_value.c_str(); }
    operator const std::string &() const { return m_value; }
    operator std::string &() { return m_value; }
    operator const std::string *() { return &m_value; }
    operator std::string *() { return &m_value; }
    StringValue &operator=(const StringValue &other)
    {
        m_value = other.m_value;
        return *this;
    }
    StringValue &operator=(const std::string &value)
    {
        m_value = value;
        return *this;
    }
    StringValue &operator=(const char *value)
    {
        m_value = value;
        return *this;
    }

protected:
    std::string m_value;
};

/*!
 * \brief Binary object value of arbitrary size.
 */
class BinaryValue : public Value, public Blob
{
public:
    BinaryValue()
        : Value()
        , Blob()
    {
    }

    virtual std::string getTypeName() const { return "binary"; }
    virtual size_t getSize() const { return getLength(); }
};

}; // namespace blfwk

#endif // _Value_h_
